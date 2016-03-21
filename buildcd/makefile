PATCH_NAME = "Langrisser 3 Patch v0.?"
LANG3_BIN_V1 = ../cd/LANGRISSER_3.BIN
LANG3_CUE_V1 = ../cd/LANGRISSER_3.CUE
LANG3_BIN_V101 = ../cd/ws-lg_tribute_d2.bin
LANG3_CUE_V101 = ../cd/ws-lg_tribute_d2.cue 
COPYCMD = cp -f
RMCMD = rm -f
 
OBJ = IP.BIN files/A0LANG.BIN files/LANG/FNT_SYS.BIN files/LANG/SCEN/D00.DAT files/LANG/FONT.BIN
FNTSYSSRC = $(wildcard ../scripts/en/fntsys*.txt)
SCENSRC = $(wildcard ../scripts/en/scen*.txt)

#PPF = lang3v1.ppf lang3v101.ppf
PPF = lang3v1.xdelta lang3v101.xdelta
EXE = LANGRISSER_3.DSK

all : $(PPF)

lang3v1.ppf : $(EXE)
	makeppf3 c -u -i 0 -d $(PATCH_NAME) $(LANG3_BIN_V1) $< $@

lang3v101.ppf : $(EXE)
	makeppf3 c -u -i 0 -d $(PATCH_NAME) $(LANG3_BIN_V2) $< $@

lang3v1.xdelta : $(EXE)
	xdelta -e -f -s $(LANG3_BIN_V1) $< $@

lang3v101.xdelta : $(EXE)
	xdelta -e -f -s $(LANG3_BIN_V101) $< $@

$(EXE) : $(OBJ)
	vcdbuild disc -b 

IP.BIN: vcdextract.exe $(LANG3_CUE_V101)
	vcdextract --extract=. $(LANG3_CUE_V101)

files/A0LANG.BIN: ../satcode/patch.bin
	satcode-insert $< $(@D)

files/LANG/FNT_SYS.BIN: ../scripts/jp/lang3.tbl $(FNTSYSSRC)
	encode -f $< files\lang\fnt_sys.bin ..\scripts\en\fntsys%dE.txt $@

files/LANG/SCEN/D00.DAT: ../scripts/jp/lang3.tbl $(SCENSRC)
	scrsceninsert -s $< files\lang\scen\d00.dat ..\scripts\en\scen%03dE.txt $@

files/LANG/FONT.BIN: ../scripts/en/font.bin
	$(COPYCMD) $< $@

clean :
	$(RMCMD) $(EXE) $(PPF)