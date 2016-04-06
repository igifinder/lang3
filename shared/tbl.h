#ifndef tbl_h__
#define tbl_h__

#ifdef __cplusplus
extern "C" {
#endif

typedef struct
{
	unsigned char *value1;
	unsigned char *value2;
	unsigned char size1;
	unsigned char size2;
} table_entry_struct;

typedef struct
{
	table_entry_struct *entry;
	int num;
	int max_entry_code_size;
	int max_entry_text_size;
} table_struct;

typedef struct
{
	int tbl_index;
	int text_index;
} textoffindex_struct;

table_struct *Table_Load(char *filename);
int Table_Get_Code_Max(table_struct *table);
int Table_Get_Text_Max(table_struct *table);
int Table_Match_Code_To_Char(table_struct *table, unsigned char *buf, unsigned char *out_data, int *out_size);
int Table_Match_Char_To_Code(table_struct *table, unsigned char *buf, int text_size, unsigned char *out_data, int *out_size);
void Table_Free (table_struct *table);
#ifdef __cplusplus
}
#endif

#endif // tbl_h__