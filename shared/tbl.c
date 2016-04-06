#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tbl.h"

table_struct *Table_Load(char *filename)
{
	table_struct *table;
	table_entry_struct *table_entry;
	FILE *fp;
	int i,j;
	int done=0;
	char length;
	char text[256], text2[256];

	if (fopen_s (&fp, filename, "rt") != 0) return NULL;

	fseek (fp, 0, SEEK_SET);

	if ((table = (table_struct *)calloc(1, sizeof(table_struct))) == NULL)
	{
		fclose(fp);
		return NULL;
	}

	while( fgets( text, 256, fp) != NULL )
	{
		if (text[0] != '\n')
			table->num++;
	}

	done = 0;

	table_entry = (table_entry_struct *)malloc (sizeof(table_entry_struct) * table->num);

	if (table_entry == NULL) 
	{
		fclose(fp);
		free(table);
		return NULL;
	}

	fseek (fp, 0, SEEK_SET);

	for (i = 0; i < table->num; i++)
	{
		length = 0;

		if (fscanf(fp, "%[^=]=%[^\n]\n", text, text2) == 2)
		{
			char tmp[3];
			table_entry[i].size1 = sizeof(char) * (strlen(text) / 2);
			table_entry[i].value1 = (unsigned char *)malloc (table_entry[i].size1);

			tmp[2] = '\0';
			for (j = 0; j < (int)strlen(text); j+=2)
			{
				tmp[0] = text[j];
				tmp[1] = text[j+1];
				table_entry[i].value1[j/2] = (unsigned char)strtol(tmp, NULL, 16);
			}

			table_entry[i].value2 = (unsigned char *)_strdup(text2);
			table_entry[i].size2 = strlen(text2);
		}
	}

	table->entry = table_entry;
	table->max_entry_code_size = Table_Get_Text_Max(table);
	table->max_entry_text_size = Table_Get_Text_Max(table);

	return table;
}

int Table_Get_Code_Max(table_struct *table)
{
	int max=0;
	int i;
	for (i = 0; i < table->num; i++)
	{
		if (table->entry[i].size1 > max)
			max = table->entry[i].size1;
	}
	return max;
}

int Table_Get_Text_Max(table_struct *table)
{
	int max=0;
	int i;
	for (i = 0; i < table->num; i++)
	{
		if (table->entry[i].size2 > max)
			max = table->entry[i].size2;
	}
	return max;
}

int Table_Match_Code_To_Char(table_struct *table, unsigned char *buf, unsigned char *out_data, int *out_size)
{
	int i;
	int matches, old_matches;
	int num_bytes=1;
	int *match_list;
	int ret;

	if ((match_list = malloc(sizeof(int)*table->num)) == NULL)
		return -1;
	for (i = 0; i < table->num; i++)
		match_list[i] = i;
	old_matches = table->num;
	matches = 0;

	for (;;)
	{
		matches = 0;
		for (i = 0; i < old_matches; i++)
		{
			if (num_bytes <= table->entry[match_list[i]].size1 &&
			    buf[num_bytes-1] == table->entry[match_list[i]].value1[num_bytes-1])
			{
				match_list[matches] = match_list[i];
				matches++;
			}
		}

		old_matches = matches;

		if (matches == 1)
		{
			memcpy(out_data, table->entry[match_list[0]].value2, table->entry[match_list[0]].size2);
			out_size[0] = table->entry[match_list[0]].size2;
			ret = table->entry[match_list[0]].size1;
			break;
		}
		else if (matches == 0)
		{
			// No matches
			ret = -2;
			break;
		}
		else
		{
			if (num_bytes >= table->max_entry_code_size)
			{
				// More than one match
				printf("Err... Found more than 1 match. Doh! Num matches = %d\n", matches);
				ret = -3;
			}
			else
				num_bytes++;
		}
	}

	free(match_list);
	return ret;
}

int Table_Match_Char_To_Code(table_struct *table, unsigned char *buf, int text_size, unsigned char *out_data, int *out_size)
{
	int i;
	int matches=0;
	int num_bytes=1;
	unsigned char temp_chunk[32];

	while (matches != 1)
	{
		matches = 0;
		memcpy(temp_chunk, buf, num_bytes);

		for (i = 0; i < table->num; i++)
		{
			if (num_bytes == table->entry[i].size2)
			{
				int i2;

				if (temp_chunk[0] == '[')
					i2 = 0;

				if (memcmp(temp_chunk, table->entry[i].value2, num_bytes) == 0)
					matches++;
			}
		}

		if (matches == 1)
		{

			if (temp_chunk[0] == 0x0D && temp_chunk[1] == 0x0A)
			{
			}
			else
			{                
				for (i = 0; i < table->num; i++)
				{
					if (num_bytes == 1)
					{
						if (temp_chunk[0] == table->entry[i].value2[0])
							out_data[0] = table->entry[i].value1[0];
					}
					else if (num_bytes == table->entry[i].size2)
					{
						int i2;

						for (i2 = 0; i2 < num_bytes; i2++)
						{
							if (temp_chunk[i2] == table->entry[i].value2[i2])
							{
								if (i2 == (num_bytes - 1))
								{
									int i3;

									for (i3 = 0; i3 < table->entry[i].size1; i3++)
										out_data[i3] = table->entry[i].value1[i3];
									out_size[0] = table->entry[i].size1;

#if 0
									counter += table->entry[i].size1;

									if (table->entry[i].value1[0] == 0xFF)
									{
										if (table->entry[i].value1[1] == 0xFE ||
											table->entry[i].value1[1] == 0xFF)
										{
											temp_int = (counter << 8) +
												(counter >> 8);

											fwrite(&temp_int, 2, 1, output_fp);
										}
									}
#endif
									return num_bytes;
								}
							}
							else
							{
								break;
							}
						}
					}
				}
			}

			num_bytes = 0;
		}

		num_bytes+= 1;
		if (num_bytes > table->max_entry_text_size && matches == 0)
		{
			unsigned char uk_char=0;

			num_bytes = 0;
			return 0;
		}
	}

	return matches == 1 ? num_bytes : 0;
}

void Table_Free (table_struct *table)
{
	int i;

	if (table)
	{
		if (table->entry)
		{
			for (i = 0; i < table->num; i++)
			{
				if (table->entry[i].value1)
				{
					free (table->entry[i].value1);
					table->entry[i].value1 = NULL;
				}
				if (table->entry[i].value2)
				{
					free (table->entry[i].value2);
					table->entry[i].value2 = NULL;
				}
			}
			free(table->entry);
		}
		free (table);
		table = NULL;
	}
}
