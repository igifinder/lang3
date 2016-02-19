// Converts a script into encoded data using a table

#include <ctype.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "../shared/hex.h"
#include "../shared/util.h"
#include "../shared/tbl.h"

table_struct *trans_table;

void ProgramUsage()
{
	printf("usage: encode [options] <table filename> <original file> <input files wildcard> <output filename>\n");
	printf("  Ex: encode -f table.tbl fnt_sys.bin script%%64.txt new-fntsys.bin\n");
	printf("options:\n"
		    "\t-f\tAssume input file data is fnt_sys data that's normally in FNT_SYS.BIN(default)\n"
		    "\t-s\tAssume input file data is syswin text data that's normally in SYSWIN.BIN\n");
	exit(1);
}

int encode_fntsys(const char *orig_filename, const char *input_files, uint32_t addr, textoffindex_struct *toi, int num_toi, char *out_filename)
{
	char filename[_MAX_PATH];
	int i,j,k;
	FILE *fp;
	FILE *outfp;
	uint32_t section_offset=(15 * 2 * 4) + 4, section_size;
	char text[512];
	uint32_t line_counter;
	unsigned char *orig_buf, *text_buffer;
	uint16_t *tbl;
	uint32_t offset, size;
	uint32_t *offsets;
	int text_counter;
	unsigned char buf[0x20000], *ptr;
	int file_count=0;
	uint32_t *orig_offsets;
	uint32_t orig_size;
	int ret;

	fp = fopen(orig_filename, "rb");

	if (fp == NULL)
	{
		printf("Error opening %s for writing\n", out_filename);
		return -1;
	}

	fseek(fp, 0, SEEK_END);
	orig_size = ftell(fp);
	fseek(fp, 0, SEEK_SET);

	if ((orig_buf = malloc(orig_size)) == NULL)
	{
		printf("Error allocating memory\n");
		fclose(fp);
		return -2;
	}

	fread((void *)orig_buf, 1, orig_size, fp);
	fclose(fp);

	if ((text_buffer = malloc(0x100000)) == NULL)
	{
		printf("Error allocating memory\n");
		free(orig_buf);
		return -2;
	}

	offsets = (uint32_t *)text_buffer;
	orig_offsets=(uint32_t *)orig_buf;
	section_offset = DoubleWordSwap(orig_offsets[0])-addr;

	for (i = 0; i < num_toi; i++)
	{
		if (toi[i].tbl_index < 0)
		{
			uint32_t start=DoubleWordSwap(orig_offsets[toi[i].text_index]);
			uint32_t end;

			if (toi[i].tbl_index == -1)
				end = DoubleWordSwap(orig_offsets[toi[i].text_index+1]);
			else
				end = addr+orig_size;

			section_size = end-start;
			memcpy(text_buffer+section_offset, orig_buf+start-addr, section_size);
			offsets[toi[i].text_index] = DoubleWordSwap(addr+section_offset);
			if (toi[i].tbl_index == -2)
			{
				int num=(DoubleWordSwap(orig_offsets[0])-addr)/4;
				for (j = 0; j < num; j++)
					offsets[toi[i].text_index+j] = orig_offsets[toi[i].text_index+j];
			}
			section_offset += section_size;
			section_size = 0;
			continue;
		}

		sprintf(filename, input_files, file_count+1);
		fp = fopen(filename, "rt");
		file_count++;
		if (fp)
		{
			line_counter=0;

			tbl = (uint16_t *)(text_buffer+section_offset);

			// Bypass header if it exists
			for (;;)
			{
				if (fscanf(fp, "%[^\n]\n", text) != 1)
					break;
				line_counter++;

				if (strstr(text, "Langrisser III dumper"))
				{
					if (fscanf(fp, "%[^\n]\n", text) != 1)
						break;
					line_counter++;
					if (strstr(text, "Cyber Warrior X"))
					{
						fscanf(fp, "%[^\n]\n", text);
						break;
					}
				}
				else if (strlen(text) != 0)
					break;
			}

			section_size = 0;
			text_counter = 0;
			size = 0;
			offset = 0;
			ptr=buf;
			
			for(;;)
			{
				if (strlen(text) > 0)
				{
					for (j = 0; j < (int)strlen(text);)
					{
						if (isascii(text[j]))
						{
							if (text[j] == '<' && text[j+1] == '$')
							{
								char text2[128];
								if (sscanf(text+j+2, "%[^>]>", text2) != 1)
								{
									printf("Error in %s on line %d parsing script file: Missing '>'\n", filename, line_counter);
									free(orig_buf);
									free(text_buffer);
									return -3;
								}

								for (k = 0; k < (int)strlen(text2); k+=2)
								{
									char tmp[3] = { text2[k], text2[k+1], '\0' };
									ptr[0] = (unsigned char)strtol(tmp, NULL, 16);
									ptr++;
									size++;
								}
								j += strchr(text+j, '>')-(text+j)+1;
							}
							else
							{
								ptr[0] = text[j];
								ptr++;
								j++;
								size++;
							}
						}
						else
						{
							int tmp;
							int ret;

							if ((ret = Table_Match_Char_To_Code(trans_table, text+j, strlen(text)-j, ptr, &tmp)) != 0)
							{
								j += ret;
								ptr += tmp;
								size += tmp;
							}
							else
							{
								printf("Warning on %s on line %d parsing script file: Unknown character 0x%02X\n", filename, line_counter, (unsigned char)text[j]);
								ptr[0] = text[j];
								ptr++;
								j++;
								size++;
							}

						}
					}
					if (size % 2 == 1)
					{
						ptr[0] = 0xFF;
						ptr++;
						size++;
					}
					tbl[text_counter] = offset;
					text_counter++;
					section_size += size;
					offset += size / 2;
					size = 0;
				}
				// read next line of text
				if (fscanf(fp, "%[^\n]\n", text) != 1)
					break;
				line_counter++;
			}

			// Adjust table entries
			for (j = 0; j < text_counter; j++)
				tbl[j] = WordSwap(tbl[j]);

			memcpy(text_buffer+section_offset+(text_counter*2), buf, section_size);

			// Update header			
			offsets[toi[i].tbl_index] = DoubleWordSwap(addr+section_offset);
			offsets[toi[i].text_index] = DoubleWordSwap(addr+section_offset+(text_counter*2));
			section_offset += (text_counter*2) + section_size;
			if (section_offset % 4)
			{
				int size=4 - (section_offset % 4);
				memset(text_buffer+section_offset, 0, size);
				section_offset += size;
			}
			section_size = 0;
			fclose(fp);
		}
	}

	if ((outfp = fopen(out_filename, "wb")) == NULL)
	{
		printf("Error opening %s for writing\n", out_filename);
		free(orig_buf);
		ret = -1;
	}
	else
	{
		fwrite((void *)text_buffer, 1, section_offset, outfp);
		free(orig_buf);
		fflush(outfp);
		fclose(outfp);
		ret = 0;
	}

	if (text_buffer)
		free(text_buffer);
	return ret;
}

int main(int argc, char *argv[])
{
	char *tbl_filename, *orig_filename, *input_filename, *output_filename;
	unsigned short counter = 0;
	int done = 0;
	unsigned short temp_int=0;
	int mode=0, i, ret;

	if (argc < 2)
		ProgramUsage();

	for (i = 1; i < argc; i++)
	{
		if (_stricmp(argv[i], "-f") == 0)
			mode = 0;
		else if (_stricmp(argv[i], "-s") == 0)
			mode = 1;
		else
		{
			if (argc-i < 4)
				ProgramUsage();
			tbl_filename = argv[i];
			orig_filename = argv[i+1];
			input_filename = argv[i+2];
			output_filename = argv[i+3];
			break;
		}
	}

   trans_table = Table_Load(tbl_filename);

   if (trans_table == NULL)
   {
      printf ("table not loaded.\n");
      exit (2);
   }

	if (mode == 1)
	{
		textoffindex_struct toi[] = {
			{ 0, 1 }, { -2, 2 },
		};
		ret = encode_fntsys(orig_filename, input_filename, 0x00258000, toi,  sizeof(toi)/sizeof(textoffindex_struct), output_filename);
	}
	else
	{
		textoffindex_struct toi[16] = {
			{ 0, 1 }, { 2, 3 }, { 4, 5 }, { 6, 7 },
			{ 8, 9 }, { 10, 11 }, { 12, 13 }, { 14, 15 },
			{ 16, 17 }, { 18, 19 }, { 20, 21 }, { 22, 23 }, 
			{ 24, 25 }, { 26, 27 }, { -1, 28 }, { 29, 30 }
		};
		ret = encode_fntsys(orig_filename, input_filename, 0x00246000, toi, sizeof(toi)/sizeof(textoffindex_struct), output_filename);
	}

   Table_Free(trans_table);
	return ret;
}
