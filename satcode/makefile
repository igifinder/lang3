KPITOUTPUT = elf
CC	=	sh-$(KPITOUTPUT)-gcc
AS	=	sh-$(KPITOUTPUT)-as
LD	=	sh-$(KPITOUTPUT)-ld
LDFLAGS	=	-nostartfiles -small --script bart.lk -Map main.map
FLAGS	=	-Wall -m2 -small
CONV = sh-$(KPITOUTPUT)-objcopy
	
#LIBS	=	"$(PPATH)\\KPIT Cummins\GNUSH$(KPITVER)-$(KPITOUTPUT)\Sh-$(KPITOUTPUT)\sh-$(KPITOUTPUT)\lib\libc.a" \
#		"$(PPATH)\\KPIT Cummins\GNUSH$(KPITVER)-$(KPITOUTPUT)\Sh-$(KPITOUTPUT)\lib\gcc\sh-$(KPITOUTPUT)\$(KPITVER2)-GNUSH_$(KPITVER)\libgcc.a"

EXE = patch.$(KPITOUTPUT)
EXE2 = patch.bin

OBJ	=       patch.o

all:	$(EXE) $(EXE2)

$(EXE):	$(OBJ)
		$(LD) $(LDFLAGS) $(OBJ) -o $(EXE)
		
$(EXE2):   $(EXE)		
		$(CONV) -O binary $(EXE) $(EXE2)
	        
obj/%.o: 	%.c
		$(CC) -c $< -o $@ $(FLAGS)
	        
obj/%.o:	%.s
		$(AS) $< -o $@
	        
pack:	        
		sh-$(KPITOUTPUT)-strip $(EXE) --strip-all

clean:	        
		rm -f *.o
		rm -f *.bin

        