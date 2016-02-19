#ifndef STDIO_H
  #define STDIO_H
  #include <stdio.h>
#endif
#include <math.h>

typedef struct stack_st* stack;

struct stack_st{
   int dato;
   stack next;
};

stack new_stack();
stack push(int dato, stack el_stack);
int top(stack el_stack);
stack pop(stack el_stack);
stack free_stack(stack el_stack);
int read_hex(char* array);
