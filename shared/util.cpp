// All sorts of annoying functions that make my life easier
#include <windows.h>
#include <stdio.h>
#include "util.h"

int round(float x)
{
   if (x - ((int)x) <  0.5)
   {
      return((int)x);
   }
   else
   {
      return ((int)(x+1));
   }
}

//////////////////////////////////////////////////////////////////////////////

unsigned short WordSwap(unsigned short data)
{
   return (((data & 0xFF00) >> 8) + ((data & 0x00FF) << 8));
}

//////////////////////////////////////////////////////////////////////////////

unsigned long DoubleWordSwap(unsigned long data)
{
   return (((data & 0xFF000000) >> 24) +
          ((data & 0x00FF0000) >> 8) +
          ((data & 0x0000FF00) << 8) + 
          ((data & 0x000000FF) << 24));
}

//////////////////////////////////////////////////////////////////////////////
