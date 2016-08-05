@Echo off
echo Inserting Program patches
satcode-insert ..\satcode\patch.bin .\files
echo Inserting translated menu's, etc.
encode -f ..\scripts\jp\lang3.tbl files\LANG\FNT_SYS.BIN ..\scripts\en\fntsys%%dE.txt files\LANG\FNT_SYS.BIN
echo Inserting tranlsated scenario script
scrsceninsert -s ..\scripts\jp\lang3.tbl files\LANG\SCEN\D00.DAT ..\scripts\en\scen%%03dE.txt files\LANG\SCEN\D00.DAT
echo Inserting new font
copy /y ..\scripts\en\font.bin files\LANG\FONT.BIN
echo Rebuilding disc
vcdbuild disc -b
echo COMPLETE! Please use langrisser_3.cue and langrisser_3.dsk to test
pause
