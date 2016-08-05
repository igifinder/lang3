/*  Copyright 2013, 2016 Theo Berkau

    This file is part of SATCODE-INSERT.

    SATCODE-INSERT is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    SATCODE-INSERT is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with SATCODE-INSERT; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
*/

#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <io.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include "../shared/util.h"

typedef struct
{
	int offset;
	int max_size;
	int patch_offset;
	int patch_size;
	unsigned char *data;
} patch_data_struct;

typedef struct
{
	char name[_MAX_PATH];
	patch_data_struct *patch_data;
	int num_patches;
} patch_file_struct;

typedef struct
{
	patch_file_struct *file;
	int num_files;
} patch_struct;

void free_patch(patch_struct *patch)
{
   int i,j;

   if (patch)
   {
		if (patch->file)
		{
			for (i = 0; i < patch->num_files; i++)
			{
				if (patch->file[i].patch_data)
				{
					for (j = 0; j < patch->file[i].num_patches; j++)
					{
						if (patch->file[i].patch_data[j].data)
							free(patch->file[i].patch_data[j].data);
					}
					free(patch->file[i].patch_data);
				}
			}
			free(patch->file);
		}
      free(patch);
   }
}

patch_struct *load_patch(char *filename)
{
   FILE *fp=NULL;
   patch_struct *patch=NULL;
   int i,j;

   // Load up compiled code
   if (fopen_s(&fp, filename, "rb") != 0)
   {
      printf("Error opening %s\n", filename);
      goto error;
   }

   patch = (patch_struct *)calloc(1, sizeof(patch_struct));
   if (patch == NULL)
   {
      printf("Error allocating memory\n");
      goto error;
   }
	fread((void *)&patch->num_files, 4, 1, fp);
	patch->num_files = DoubleWordSwap(patch->num_files);

	patch->file = (patch_file_struct *)calloc(patch->num_files, sizeof(patch_file_struct));
	if (patch->file == NULL)
	{
		printf("Error allocating memory\n");
		goto error;
	}

   for (i = 0; i < patch->num_files; i++)
   {		
		fread(patch->file[i].name, 1, sizeof(patch->file[i].name), fp);
		fread(&patch->file[i].num_patches, sizeof(int), 1, fp);
		patch->file[i].num_patches = DoubleWordSwap(patch->file[i].num_patches);

		patch->file[i].patch_data = (patch_data_struct *)calloc(patch->file[i].num_patches, sizeof(patch_data_struct));
		if (patch->file[i].patch_data == NULL)
		{
			printf("Error allocating memory\n");
			goto error;
		}

		for (j = 0; j < patch->file[i].num_patches; j++)
		{
			patch_data_struct *patch_data=&patch->file[i].patch_data[j];
			fread((void *)&patch_data->offset, sizeof(int), 1, fp);
			fread((void *)&patch_data->max_size, sizeof(int), 1, fp);
			fread((void *)&patch_data->patch_offset, sizeof(int), 1, fp);
			fread((void *)&patch_data->patch_size, sizeof(int), 1, fp);
			patch_data->offset = DoubleWordSwap(patch_data->offset);
			patch_data->max_size = DoubleWordSwap(patch_data->max_size);
			patch_data->patch_offset = DoubleWordSwap(patch_data->patch_offset);
			patch_data->patch_size = DoubleWordSwap(patch_data->patch_size);

			if (patch_data->patch_size > patch_data->max_size)
			{
				printf("Error file %s patch %d is too large. %d bytes, needs to be <= %d\n", patch->file[i].name, j+1, patch_data->patch_size, patch_data->max_size);
				goto error;
			}
		}
   }

	for (i = 0; i < patch->num_files; i++)
	{
		for (j = 0; j < patch->file[i].num_patches; j++)
		{
			patch_data_struct *patch_data=&patch->file[i].patch_data[j];

			if ((patch_data->data = malloc(patch_data->patch_size)) == NULL)
			{
				printf("Error allocating memory\n");
				exit(1);
			}

			fseek(fp, patch_data->patch_offset, SEEK_SET);
			fread((void *)patch_data->data, 1, patch_data->patch_size, fp);
		}
	}

   fclose(fp);
   return patch;

error:
   if (fp)
      fclose(fp);

   free_patch(patch);
   return NULL;
}

int main(int argc, char *argv[])
{
   char *input_filename;
   char *output_dir;
   int i,j;
   FILE *fp=NULL;
   patch_struct *patch=NULL;
   int size;
   unsigned char *data=NULL;
   struct stat info;

   if (argc != 3)
   {
      printf ("satcode-insert compiled_code.bin target_dir\n");
      goto error;
   }

   input_filename = argv[1];
   output_dir = argv[2];

	// Load up patch
	if ((patch = load_patch(input_filename)) == NULL)
		exit(1);

   stat( output_dir, &info );
   if (!(info.st_mode & S_IFDIR))
   {
      printf ("Second argument needs to be a directory\n");
      goto error;
   }

	for (i = 0; i < patch->num_files; i++)
	{
		char output_filename[_MAX_PATH];
		char drive[_MAX_DRIVE], dir[_MAX_DIR], fn[_MAX_FNAME];

		_splitpath(output_dir, drive, dir, fn, NULL);
		strcat(dir, fn);
		_makepath(output_filename, drive, dir, patch->file[i].name, "");

		// Load up output
		if (fopen_s(&fp, output_filename, "rb") != 0)
		{
			printf("Error opening %s\n", output_filename);
			goto error;
		}

		size = _filelength(_fileno(fp));
		if ((data = malloc(size)) == NULL)
			goto error;

		fread((void *)data, 1, size, fp);
		fclose(fp);

		// Now apply patches
		for (j = 0; j < patch->file[i].num_patches; j++)
			memcpy(data+patch->file[i].patch_data[j].offset, patch->file[i].patch_data[j].data, patch->file[i].patch_data[j].patch_size);

		// Lastly, let's write file
		if (fopen_s(&fp, output_filename, "wb") != 0)
		{
			printf("Error writing %s\n", output_filename);
			goto error;
		}

		fwrite((void *)data, 1, size, fp);
		fclose(fp);
	}

   printf("done\n");

error:
   if (patch)
      free_patch(patch);

   if (data)
      free(data);
   if (fp)
      fclose(fp);

   return 0;
}
