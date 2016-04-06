// Utility for dumping text from scen.dat

#include <windows.h>
#include <stdio.h>
#include <stdint.h>
//#include "hex.h"
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
// 0xF7xx A delay or something? Terminating Character?
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

#define PROG_NAME "SCRSCENDUMP"
#define VER_NAME "1.1"
#define COPYRIGHT_YEAR "2002-2003, 2016"

table_struct *trans_table;

typedef struct
{
   unsigned long offset;
   unsigned long size;
} pointer_struct;

int dump_section(FILE *input_fp, pointer_struct *ptr, const char *output_filename)
{
	FILE *output_fp;
	unsigned short num_text=0;
	unsigned long i;
	unsigned char *temp_buffer;

	// allocate buffer for text section
	if ((temp_buffer = (unsigned char *)malloc(ptr->size)) == NULL)
	{
		printf("Unable to allocate text section buffer\n");
		return -1;
	}

	// read the whole text section into temp_buffer, it's far faster than
	// doing mass amounts of fread's
	fseek(input_fp, ptr->offset, SEEK_SET);
	fread((void *)temp_buffer, 1, ptr->size, input_fp);

	// grab the first text segment(we can figure out the number of text
	// segments from this)
	num_text = (temp_buffer[4] << 8) + temp_buffer[5];
	num_text = (num_text - 4) / 2;

	//      printf("%d - Number of text segments = %x\n", i, num_text);

	// open output file
	if ((output_fp = fopen(output_filename, "wb")) == NULL)
	{
		printf("Unable to open %s for writing\n", output_filename);
		free(temp_buffer);
		return -3;
	}

	printf("Writing %s...", output_filename);

	fprintf(output_fp, "Langrisser III dumper [0x%x to 0x%x]\r\n\r\n"
		"Cyber Warrior X\r\n\r\n", ptr->offset+WordSwap(*(uint16_t *)(temp_buffer+4)), ptr->offset+ptr->size-1);

	// generate shift-jis text and write to file
	for (i = 0; i < num_text; i++)
	{
		unsigned long counter=0;
		unsigned short offset=0;

		offset = (temp_buffer[4 + (i * 2)] << 8) + temp_buffer[4 + (i * 2) + 1];
		//         printf("absolute offset = %02x\n", offset_data[i].offset + offset);

		for (;;)
		{
			int ret=0;
			unsigned char data[256];
			int data_size=0;

			ret = Table_Match_Code_To_Char(trans_table, temp_buffer + offset + counter, data, &data_size);

			if (ret > 0)
			{
				//               printf("value2 = %s size2 = %d\n", trans_table[ret].value2, trans_table[ret].size2);
				fwrite((void *)data, data_size, 1, output_fp);
				counter += ret;           
			}
			else
			{
				if (temp_buffer[offset + counter] == 0xFF && 
					temp_buffer[offset + counter + 1] == 0xF6)
				{
					//printf("%08x: 0xFFF6 used(written to %08x)\n", offset + counter, ftell(output_fp));
					fputs("<$FFF6>", output_fp);
					counter += 2;
				}
				else if (temp_buffer[offset + counter] == 0xFF && 
					temp_buffer[offset + counter + 1] == 0xF5)
				{
					//printf("%08x: 0xFFF5 used(written to %08x)\n", offset + counter, ftell(output_fp));
					fputs("<$FFF5>", output_fp);
					counter += 2;
				}
				else if (temp_buffer[offset + counter] == 0xFF && 
					temp_buffer[offset + counter + 1] == 0xF7)
				{
					//printf("%08x: 0xFFF7 used(written to %08x)\n", offset + counter, ftell(output_fp));
					fprintf(output_fp, "<$FFF7%02X%02X>", temp_buffer[offset + counter + 2], temp_buffer[offset + counter + 3]);
					counter += 4;
				}
				else if (temp_buffer[offset + counter] == 0xFF && 
					temp_buffer[offset + counter + 1] == 0xF8)
				{
					//printf("%08x: 0xFFF8 used(written to %08x)\n", offset + counter, ftell(output_fp));
					fprintf(output_fp, "<$FFF8%02X%02X>", temp_buffer[offset + counter + 2], temp_buffer[offset + counter + 3]);
					counter += 4;
				}
				else if (temp_buffer[offset + counter] == 0xFF && 
					temp_buffer[offset + counter + 1] == 0xF9)
				{
					//printf("%08x: 0xFFF9 used(written to %08x)\n", offset + counter, ftell(output_fp));
					fputs("<$FFF9>", output_fp);
					counter += 2;
				}
				else if (temp_buffer[offset + counter] == 0xFF && 
					temp_buffer[offset + counter + 1] == 0xFA)
				{
					//printf("%08x: 0xFFFA used(written to %08x)\n", offset + counter, ftell(output_fp));
					fputs("<$FFFA>", output_fp);
					counter += 2;
				}
				else if (temp_buffer[offset + counter] == 0xFF && 
					temp_buffer[offset + counter + 1] == 0xFB)
				{
					// Waits for the user to press a button
					fputs("<$FFFB>", output_fp);
					counter += 2;
				}
				else if (temp_buffer[offset + counter] == 0xFF && 
					temp_buffer[offset + counter + 1] == 0xFC)
				{
					// Newline
					fprintf(output_fp, "<$FFFC>\r\n");
					counter += 2;
				}
				else if (temp_buffer[offset + counter] == 0xFF && 
					temp_buffer[offset + counter + 1] == 0xFD)
				{
					// Line scroll
					fprintf(output_fp, "<$FFFD>\r\n");
					counter += 2;
				}
				else if (temp_buffer[offset + counter] == 0xFF && 
					temp_buffer[offset + counter + 1] == 0xFE)
				{
					fprintf(output_fp, "<$FFFE>\r\n");
					break;
				}
				else if (temp_buffer[offset + counter] == 0xFF && 
					temp_buffer[offset + counter + 1] == 0xFF)
				{
					// end of a string
					fprintf(output_fp, "<$FFFF>\r\n");
					break;
				}
				else if (temp_buffer[offset + counter] == 0xF7)
				{
					//printf("%08X: 0xF7xx used\n", ftell(output_fp));
					fprintf(output_fp, "<$F7%02X>", temp_buffer[offset + counter + 1]);
					counter += 2;
					i++;
				}
				else if (temp_buffer[offset + counter] == 0xFE)
				{
					// some kind of delay code?

					// for now
					//printf("%08X: 0xFExx used\n", ftell(output_fp));
					fprintf(output_fp, "<$FE%02X>", temp_buffer[offset + counter + 1]);
					counter += 2;
				}
				else
				{
					// just insert the character as <$hex>
					//printf("can't figure out character %02X%02X%02X%02X\n", temp_buffer[offset + counter], temp_buffer[offset + counter + 1], temp_buffer[offset + counter + 2], temp_buffer[offset + counter + 3]);
					fprintf(output_fp, "<$%02X>",  temp_buffer[offset + counter]);
					counter++;
				}
			}
		}
	}

	printf("done.\n", output_filename);

	// close file
	free(temp_buffer);
	fclose(output_fp);

	return 0;
}

int dump_d00(const char *input_filename, const char *output_dir)
{
	char drive[_MAX_DRIVE], dir[_MAX_DIR], fn[_MAX_FNAME];
	FILE *input_fp;
	int done = 0;
	unsigned long num_offsets=0;
	unsigned long i;
	pointer_struct *offset_data;

	// Main program
	if (fopen_s(&input_fp, input_filename, "rb") != 0)
	{
		printf("Could not open input file\n");
		return -1;
	}

	// figure out how many text sections to dump
	fread((void *)&num_offsets, 4, 1, input_fp);
	num_offsets = DoubleWordSwap(num_offsets);

	//   printf("number of offsets = %x - %d\n", num_offsets, num_offsets);

	// allocate and grab offset list
	if ((offset_data = (pointer_struct *)malloc(sizeof(pointer_struct) * num_offsets)) == NULL)
	{
		printf("Unable to allocate offset/size list\n");
		fclose(input_fp);
		return -2;
	}

	for (i = 0; i < num_offsets; i++)
	{
		fread((void *)&offset_data[i].offset, 4, 1, input_fp);
		fread((void *)&offset_data[i].size, 4, 1, input_fp);
		offset_data[i].offset = DoubleWordSwap(offset_data[i].offset) * 0x800;
		offset_data[i].size = DoubleWordSwap(offset_data[i].size);

		//      printf("offset_data[%d] offset = %08x size = %08x\n", i, offset_data[i].offset, offset_data[i].size);
	}

	for (i = 0; i < num_offsets; i++)
	{
		unsigned long temp_long=0;
		unsigned long temp_long2=0;

		// figure out the absolute offset of the text section
		fseek(input_fp, offset_data[i].offset, SEEK_SET);
		fread((void *)&temp_long, 4, 1, input_fp);
		temp_long = DoubleWordSwap(temp_long);

		fseek(input_fp, offset_data[i].offset + temp_long + 0x40, SEEK_SET);
		fread((void *)&temp_long2, 4, 1, input_fp);
		temp_long2 = DoubleWordSwap(temp_long2);

		// horray! Now we know the absolute offset of the text section!
		offset_data[i].offset += (temp_long + temp_long2);

		// Now grab the text section's size
		fseek(input_fp, offset_data[i].offset, SEEK_SET);
		fread((void *)&offset_data[i].size, 4, 1, input_fp);
		offset_data[i].size = DoubleWordSwap(offset_data[i].size);
	}

	// start a for loop that goes through each offset
	for (i = 0; i < num_offsets; i++)
	{
		char output_filename[_MAX_PATH];
		_splitpath(output_dir, drive, dir, fn, NULL);
		strcat(dir, fn);

		// generate output filename
		sprintf(fn, "scen%d\0", i + 1);
		_makepath(output_filename, drive, dir, fn, ".sjs");

		dump_section(input_fp, &offset_data[i], output_filename);
	}

	fclose(input_fp);
	free(offset_data);
	return 0;
}

int dump_plot(const char *input_filename, const char *output_dir)
{
	char output_filename[_MAX_PATH];
	char drive[_MAX_DRIVE], dir[_MAX_DIR], fn[_MAX_FNAME];
	FILE *input_fp;
	pointer_struct ptr;
	int ret;
	
	if ((input_fp=fopen(input_filename, "rb"))== NULL)
	{
		printf("Could not open input file\n");
		return -1;
	}

	ptr.offset = 0;
	fseek(input_fp, 0, SEEK_END);
	ptr.size = ftell(input_fp);
	fseek(input_fp, 0, SEEK_SET);

	_splitpath(output_dir, drive, dir, fn, NULL);
	strcat(dir, fn);

	// generate output filename
	_makepath(output_filename, drive, dir, "plot", ".sjs");

	ret = dump_section(input_fp, &ptr, output_filename);
	fclose(input_fp);
	return ret;
}

void ProgramUsage()
{
   char text[512]=PROG_NAME;
   printf(PROG_NAME " v" VER_NAME " - by Cyber Warrior X (c)" COPYRIGHT_YEAR "\n");
	_strlwr_s(text, sizeof(text));
   printf("usage: %s [options] <tbl filename> <data filename> <output directory>\n\n", text);
	printf("options:\n"
		    "\t-s\tAssume input file data is scenario event data that's normally in D00.DAT(default)\n"
			 "\t-p\tAssume input file data is plot text data that's normally in PLOT.DAT\n");
   exit(1);
}

int main(int argc, char *argv[])
{
   char *tbl_filename, *input_filename, *output_dir;
	int mode=0;
	int i, ret;

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
			if (argc-i < 3)
				ProgramUsage();
			tbl_filename = argv[i];
			input_filename = argv[i+1];
			output_dir = argv[i+2];
			break;
		}
	}

   if ((trans_table = Table_Load(tbl_filename)) == NULL)
   {
      printf ("table not loaded.\n");
      exit (0);
   }

	if (mode == 1)
		ret = dump_plot(input_filename, output_dir);
	else
		ret = dump_d00(input_filename, output_dir);

   Table_Free(trans_table);

   return ret;
}

///////////////////////////////////////////////////////////////////////////////


