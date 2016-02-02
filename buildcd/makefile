PATCH_NAME = "Langrisser 3 Patch v0.1"

OBJ = IP.BIN

#PPF = lang3.ppf
PPF = lang3.xdelta
EXE = LANGRISSER_3.DSK

all : $(PPF)

%.ppf : $(EXE)
	makeppf3 c -u -i 0 -d $(PATCH_NAME) "..\cd\LANGRISSER_3.BIN" $< $@

%.xdelta : $(EXE)
	xdelta -e -f -s "..\cd\LANGRISSER_3.BIN" $< $@

$(EXE) : $(OBJ)
	vcdbuild disc /b

ip.bin : vcdextract.exe ..\cd\LANGRISSER_3.cue
	vcdextract --extract=. ..\cd\LANGRISSER_3.cue

clean :
	rm -f $(EXE) $(PPF)