#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>
#include "hex.h"

stack new_stack()
{
   return((stack)NULL);
}

stack push(int dato, stack el_stack)
{
  stack tmp;

  tmp = (stack)malloc(sizeof(struct stack_st));
  if(!tmp)
  {
     printf("No memory\n");
     exit(1);
  }
  tmp->dato = dato;
  tmp->next = el_stack;
  return(tmp);
}

int top(stack el_stack)
{
   if(el_stack)
      return(el_stack->dato);
   else
      return(-1);
}

stack pop(stack el_stack)
{
  stack tmp;

  if(el_stack)
  {
    tmp = el_stack->next; 
    free(el_stack);
    return(tmp);
  }  
  else
    return(el_stack);
}

stack free_stack(stack el_stack)
{
  stack tmp;

  tmp = el_stack;
  while(tmp)
    tmp = pop(el_stack);
  return(tmp);
}

int read_hex(char* array)
{
  int pos, tmp, val;
  char c;
  stack datos;

  val = 0;
  pos = 0;
  datos = new_stack();
  while((c = array[pos]) && pos < (int)strlen(array))
  {
     if(c == '*')
     {
	datos = free_stack(datos);
	return(-2);
     }
     c = toupper(c);
     if(c <= 'F' && c >= 'A')
        tmp = c - 'A' + 10;
     else
       if(c >= '0' && c <= '9')
          tmp = c - '0';
       else
       {
	  datos = free_stack(datos);
          return(-1);
       }
     datos = push(tmp, datos);
     pos ++;
  }
  pos = 0;
  while(datos && tmp != -1)
  {
     tmp = top(datos);
     datos = pop(datos);
     if(tmp != -1)
       val = val + (tmp * (int)pow(16, pos));
     pos ++;
  }
  return(val);
}
