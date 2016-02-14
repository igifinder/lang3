// Utility for dumping text to script file

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include "../shared/hex.h"
#include "../shared/util.h"
#include "../shared/tbl.h"

table_struct *trans_table;

void ProgramUsage()
{
	printf("usage: dump [options] <table filename> <input filename> <output directory>\n\n");
	printf("options:\n"
		"\t-f\tAssume input file data is fnt_sys data that's normally in FNT_SYS.BIN(default)\n"
		"\t-s\tAssume input file data is syswin text data that's normally in SYSWIN.BIN\n");
	exit(1);
}

typedef struct
{
	uint32_t text_off;
	uint32_t tbl_off;
	uint16_t *tbl;
	int num_tbl;
} text_struct;

int dump_fntsys(const char *filename, uint32_t addr, textoffindex_struct *toi, uint32_t num_toi, char *out_dir)
{
	uint32_t i, j;
	long size;
	unsigned char *buf;

	FILE *fp = fopen(filename, "rb"), *output_fp;

	if (fp)
	{
		fseek(fp, 0, SEEK_END);
		size = ftell(fp);
		fseek(fp, 0, SEEK_SET);

		if ((buf = (unsigned char *)malloc(size)) == NULL)
		{
			printf("Error allocating memory\n");
			return -1;
		}		

		fread((void *)buf, 1, size, fp);
		fclose(fp);		

		for (i = 0; i < num_toi; i++)
		{
			long end;
			char drive[_MAX_DRIVE], dir[_MAX_DIR], fn[_MAX_FNAME];
			char output_filename[_MAX_PATH];
			uint32_t *off=buf;
			uint32_t tbl_off, text_off, num_tbl;

			_splitpath(out_dir, drive, dir, fn, NULL);
			strcat(dir, fn);
			_splitpath(filename, NULL, NULL, fn, NULL);
			itoa(i+1, fn+strlen(fn), 10);
			_makepath(output_filename, drive, dir, fn, ".sjs");

			printf("Writing %s...", output_filename);

			if ((output_fp = fopen(output_filename, "wt")) == NULL)
			{
				printf("Error opening %s for writing\n", output_filename);
				fclose(fp);
				return -2;
			}

			tbl_off=(DoubleWordSwap(off[toi[i].tbl_index])-addr);
			text_off=(DoubleWordSwap(off[toi[i].text_index])-addr);
			num_tbl=(text_off-tbl_off)/2;

			if (i != num_toi-1)				
				end = (DoubleWordSwap(off[toi[i+1].tbl_index])-addr);
			else
				end = size-1;

			fprintf(output_fp, "Langrisser III dumper [0x%x to 0x%x]\n\n", text_off, end);
			fprintf(output_fp, "Cyber Warrior X\n");
			fprintf(output_fp, "\n");			

			for (j = 0; j < num_tbl; j++)
			{
				uint32_t offset = text_off+(WordSwap(*(uint16_t *)(buf+tbl_off+(j*2)))*2);
				unsigned long counter=0;
				for (;;)
				{
					int data_size;
					unsigned char data[256];
					int ret = Table_Match_Code_To_Char(trans_table, buf + offset + counter, data, &data_size);

					if (ret > 0)
					{
						fwrite((void *)data, data_size, 1, output_fp);
						counter += ret;           
					}
					else
					{
						if (buf[offset + counter] == 0xFF && 
							buf[offset + counter + 1] == 0xFF)
						{
							// end of a string
							fprintf(output_fp, "<$FFFF>\n");
							break;
						}
						else
						{
							// just insert the character as <$hex>
							//printf("can't figure out character %02X%02X%02X%02X\n", temp_buffer[offset + counter], temp_buffer[offset + counter + 1], temp_buffer[offset + counter + 2], temp_buffer[offset + counter + 3]);
							fprintf(output_fp, "<$%02X>",  buf[offset + counter]);
						}

					}
				}
			}

			fclose(output_fp);
			printf("done.\n");
		}

		free(buf);
	}

	return 0;
}

int main(int argc, char *argv[])
{
	char *tbl_filename, *input_filename, *out_dir;
	int mode,i,ret;

	for (i = 1; i < argc; i++)
	{
		if (_stricmp(argv[i], "-f") == 0)
			mode = 0;
		else if (_stricmp(argv[i], "-s") == 0)
			mode = 1;
		else
		{
			if (argc-i < 3)
				ProgramUsage();
			tbl_filename = argv[i];
			input_filename = argv[i+1];
			out_dir = argv[i+2];
			break;
		}
	}

	trans_table = Table_Load(tbl_filename);

	if (trans_table == NULL)
	{
		printf ("table not loaded.\n");
		exit (0);
	}

	if (mode == 1)
	{
		textoffindex_struct toi[] = { 0, 1 };
		ret = dump_fntsys(input_filename, 0x00258000, &toi, 1, out_dir);
	}
	else
	{
		textoffindex_struct toi[15] = {
			{ 0, 1 }, { 2, 3 }, { 4, 5 }, { 6, 7 },
			{ 8, 9 }, { 10, 11 }, { 12, 13 }, { 14, 15 },
			{ 16, 17 }, { 18, 19 }, { 20, 21 }, { 22, 23 }, 
			{ 24, 25 }, { 26, 27 }, { 29, 30 }
		};
		ret = dump_fntsys(input_filename, 0x00246000, toi, 15, out_dir);
	}

	Table_Free(trans_table);
   return ret;
}

