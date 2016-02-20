// Utility for inserting text into scen.dat

#include <windows.h>
#include <stdio.h>
#include <stdint.h>
#include "../shared/util.h"
#include "../shared/tbl.h"

// D00.DAT format:
// 0x00000000: Number of entries(4 bytes)
// 0x00000004: Entry #1 offset in sectors(4 bytes)
// 0x00000008: Entry #1 Size in bytes(4 bytes)
// ...

// Code list
// 0xF6000000 dieharte's name
// 0xF600FFFC variation of above?
// 0xF7xx ???
// 0xFExx ???
// 0xFFF9 ???
// 0xFFFA ???
// 0xFFFB waits for the user to press a button
// 0xFFFC jump to next line in window
// 0xFFFD Instead of actually clearing the window, it scrolls everything up
//        on a line by line basis
// 0xFFFE clear window?
// 0xFFFF is a string termination code(basically like \0 is on the x86)

// lushiris' dialogue window uses 5 lines

///////////////////////////////////////////////////////////////////////////////

#define PROG_NAME "SCRSCENINSERT"
#define VER_NAME "1.0"
#define COPYRIGHT_YEAR "2016"

//char output_filename[512];
//unsigned char *temp_buffer;

table_struct *trans_table;

typedef struct
{
	unsigned long offset;
	unsigned long size;
} pointer_struct;

//pointer_struct *offset_data;

void ProgramUsage()
{
	char text[512]=PROG_NAME;
	printf(PROG_NAME " v" VER_NAME " - by Cyber Warrior X (c)" COPYRIGHT_YEAR "\n");
	_strlwr_s(text, sizeof(text));
	printf("usage: %s <table filename> <original D00.DAT filename> <input files wildcard> <output filename>\n", text);
	printf("  Ex: %s -s table.tbl d00.dat script%%64.txt new-d00.dat\n", text);
	printf("options:\n"
		"\t-s\tAssume input file data is scenario event data that's normally in D00.DAT(default)\n"
		"\t-p\tAssume input file data is plot text data that's normally in PLOT.DAT\n");

	exit(1);
}

int insert_section(const char *filename, unsigned char *text_buffer, uint32_t *section_offset, uint32_t t1t2size, uint32_t *offsets)
{
	int line_counter=0;
	uint16_t *tbl;
	FILE *fp;
	char text[2048], text2[512];
	uint32_t section_size;
	int text_counter;
	uint32_t offset, size;
	unsigned char buf[0x20000], *bufp;
	int j,k;

	if ((fp = fopen(filename, "rt")) == NULL)
		return -1;

	printf("Inserting %s...", filename);

	tbl = (uint16_t *)(text_buffer+section_offset[0]+t1t2size+4);

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
	bufp=buf;

	for(;;)
	{
		if (strlen(text) > 0)
		{
			for (;;)
			{
				char *p = strrchr(text, '<');
				if (p == NULL)
				{
					printf("Error in %s on line %d parsing script file: Missing or invalid end tag\n", filename, line_counter);
					return -3;
				}
				sscanf(p+2, "%[^>]>", text2);
				if (strcmp(text2, "FFFE") != 0 && strcmp(text2, "FFFF") != 0)
				{
					// Fetch another line
					if (fscanf(fp, "%[^\n]\n", text2) == 1)
					{
						strcat(text, text2);
						line_counter++;
					}
				}
				else 
					break;
			}

			for (j = 0; j < (int)strlen(text);)
			{
				if (isascii(text[j]))
				{
					if (text[j] == '<' && text[j+1] == '$')
					{
						if (sscanf(text+j+2, "%[^>]>", text2) != 1)
						{
							printf("Error in %s on line %d parsing script file: Missing '>'\n", filename, line_counter);
							return -3;
						}

						for (k = 0; k < (int)strlen(text2); k+=2)
						{
							char tmp[3] = { text2[k], text2[k+1], '\0' };
							bufp[0] = (unsigned char)strtol(tmp, NULL, 16);
							bufp++;
							size++;
						}

						if (bufp[-2] == 0xF7)
						{
							tbl[text_counter] = offset;
							text_counter++;
							section_size += size;
							offset += size;
							size = 0;
						}

						char *p = strchr(text+j, '>');
						if (p == NULL)
						{
							printf("Error in %s on line %d parsing script file: Missing '>'\n", filename, line_counter);
							return -3;
						}

						j += p-(text+j)+1;
					}
					else if (text[j] == '[' && text[j+1] == 'd' &&
						memcmp(text+j, "[diehardt's name]", 17) == 0)
					{
						unsigned char data[] = { 0xF6, 0x00, 0x00, 0x00 };
						memcpy(bufp, data, sizeof(data));
						j += 17;
						bufp += sizeof(data);
						size += sizeof(data);
					}
					else
					{
						bufp[0] = text[j];
						bufp++;
						j++;
						size++;
					}
				}
				else
				{
					int tmp;
					int ret;

					if ((ret = Table_Match_Char_To_Code(trans_table, (unsigned char *)text+j, strlen(text)-j, bufp, &tmp)) != 0)
					{
						j += ret;
						bufp += tmp;
						size += tmp;
					}
					else
					{
						printf("Warning on %s on line %d parsing script file: Unknown character 0x%02X\n", filename, line_counter, (unsigned char)text[j]);
						bufp[0] = text[j];
						bufp++;
						j++;
						size++;
					}

				}
			}
			if (size % 2 == 1)
			{
				bufp[0] = 0xFF;
				bufp++;
				size++;
			}
			tbl[text_counter] = offset;
			text_counter++;
			section_size += size;
			offset += size;
			size = 0;
		}
		// read next line of text
		if (fscanf(fp, "%[^\n]\n", text) != 1)
			break;
		line_counter++;
	}

	// 4 byte align
	if (((text_counter*2)+section_size) % 4 != 0)
	{
		int n=4 - ((text_counter*2)+section_size) % 4;
		memset(bufp, 0xFF, n);
		bufp+=n;
		section_size+=n;
	}

	// Adjust table entries
	for (j = 0; j < text_counter; j++)
		tbl[j] = WordSwap(4+(text_counter*2)+tbl[j]);

	*(uint32_t *)(text_buffer+section_offset[0]+t1t2size) = DoubleWordSwap(4+(text_counter*2)+section_size);
	memcpy(text_buffer+section_offset[0]+t1t2size+4+(text_counter*2), buf, section_size);

	// Update header			
	offsets[0] = DoubleWordSwap(section_offset[0]/2048);
	offsets[1] = DoubleWordSwap(t1t2size+4+(text_counter*2)+section_size);
	section_offset[0] += t1t2size+4+(text_counter*2)+section_size;
	if (section_offset[0] & 0x7FF)
	{
		section_offset[0] += 0x800;
		section_offset[0] &= ~0x7FF;
	}
	section_size = 0;
	fclose(fp);
	printf("done.\n");
	return 0;
}

int insert_d00(const char *orig_filename, const char *input_files, const char *out_filename)
{
	char filename[_MAX_PATH];
	int i,j,k;
	FILE *origfp, *outfp;
	uint32_t section_offset=0x800;
	unsigned char *text_buffer;
	//uint16_t *tbl;
	uint32_t offset, size;
	uint32_t *offsets;
	//int text_counter;
	int num_sections;
	int ret;

	origfp = fopen(orig_filename, "rb");

	if (origfp == NULL)
	{
		printf("Error opening %s for reading\n", out_filename);
		return -1;
	}

	if ((text_buffer = (unsigned char *)calloc(0x800000, sizeof(unsigned char))) == NULL)
	{
		printf("Error allocating memory\n");
		fclose(origfp);
		fclose(outfp);
		return -2;
	}

	offsets = (uint32_t *)(text_buffer+4);

	fread((void *)&num_sections, 4, 1, origfp);
	*((uint32_t *)text_buffer) = num_sections;
	num_sections = DoubleWordSwap(num_sections);

	for (i = 0; i < num_sections; i++)
	{
		// Section:
		// 0x00000000: table1(each entry is 4 bytes), first entry is offset to second table 
		// 0x????????: data for table1 here
		// 0x????????: table2(each entry is 4 bytes). Last entry in table is offset to table 3
		// 0x????????: data for table 2
		// 0x????????: table 3. First entry is size of table 3 + table 3 data(text strings)(4 bytes), after that it's offsets to strings(2 bytes per entry), after that strings.

		uint32_t tbl1offset, tbl2offset, t1t2size;

		fseek(origfp, 4+(i*8), SEEK_SET);
		fread((void *)&offset, 4, 1, origfp);
		offset = DoubleWordSwap(offset);
		fread((void *)&size, 4, 1, origfp);
		size = DoubleWordSwap(size);

		fseek(origfp, offset*2048, SEEK_SET);
		// Table 1
		fread((void *)&tbl1offset, 4, 1, origfp);
		tbl1offset = DoubleWordSwap(tbl1offset);

		fseek(origfp, (offset*2048)+tbl1offset+(16*4), SEEK_SET);
		// Table 2
		fread((void *)&tbl2offset, 4, 1, origfp);
		tbl2offset = DoubleWordSwap(tbl2offset);

		t1t2size = tbl1offset+tbl2offset;

		// Backup table 1 and table 1 data, table 2 and table 2 data
		fseek(origfp, offset*2048, SEEK_SET);
		fread(text_buffer+section_offset, 1, t1t2size, origfp);

		sprintf(filename, input_files, i+1);
		ret = insert_section(filename, text_buffer, &section_offset, t1t2size, offsets+(i*2));

		if (ret == -1)
		{
			fseek(origfp, offset*2048, SEEK_SET);
			fread(text_buffer+section_offset, 1, size, origfp);

			offsets[(i*2)] = DoubleWordSwap(section_offset/2048);
			offsets[(i*2)+1] = DoubleWordSwap(size);
			section_offset += size;

			if (section_offset & 0x7FF)
			{
				section_offset += 0x800;
				section_offset &= ~0x7FF;
			}

			ret = 0;
		}
		if (ret != 0)
		{
			fclose(origfp);
			free(text_buffer);
			return ret;
		}
	}

	if ((outfp = fopen(out_filename, "wb")) == NULL)
	{
		printf("Error opening %s for writing\n", out_filename);
		ret = -1;
	}
	else
	{
		fwrite((void *)text_buffer, 1, section_offset, outfp);
		fflush(outfp);
		ret = 0;
	}

	if (origfp)
		fclose(origfp);
	if (outfp)
		fclose(outfp);
	if (text_buffer)
		free(text_buffer);
	return ret;
}

int insert_plot(const char *input_filename, const char *out_filename)
{
	uint32_t offsets[2];
	int ret;
	unsigned char *text_buffer;
	FILE *fp;
	uint32_t section_offset=0, t1t2size=0;

	if ((text_buffer = (unsigned char *)calloc(0x800000, sizeof(unsigned char))) == NULL)
	{
		printf("Error allocating memory\n");
		return -2;
	}

	ret=insert_section(input_filename, text_buffer, &section_offset, t1t2size, offsets);
	
	if ((fp = fopen(out_filename, "wb")) == NULL)
	{
		printf("Error opening %s for writing\n", out_filename);
		free(text_buffer);
		return -3;
	}

	fwrite((void *)text_buffer, 1, DoubleWordSwap(offsets[1]), fp);
	fclose(fp);
	return 0;
}

int main(int argc, char *argv[])
{
	char *tbl_filename, *input_filename, *script_filenames, *output_filename;
	int done = 0;
	unsigned long num_offsets=0;
	int mode=0;
	int ret;
	int i;

	if (argc < 2)
		ProgramUsage();

	for (i = 1; i < argc; i++)
	{
		if (_stricmp(argv[i], "-s") == 0)
			mode = 0;
		else if (_stricmp(argv[i], "-p") == 0)
			mode = 1;
		else
		{
			if ((mode == 0 && argc-i < 4) || (mode == 1 && argc-i < 3))
				ProgramUsage();
			tbl_filename = argv[i];
			input_filename = argv[i+1];
			if (mode == 0)
			{
				script_filenames = argv[i+2];
				output_filename = argv[i+3];
			}
			else if (mode == 1)
				output_filename = argv[i+2];
			break;
		}
	}

	if ((trans_table = Table_Load(tbl_filename)) == NULL)
	{
		printf ("table not loaded.\n");
		exit (0);
	}

	if (mode == 1)
		ret = insert_plot(input_filename, output_filename);
	else
		ret = insert_d00(input_filename, script_filenames, output_filename);

	Table_Free(trans_table);

	return ret;
}
