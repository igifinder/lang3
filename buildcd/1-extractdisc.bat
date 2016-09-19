@Echo off
set LANG3_BIN=..\cd\LANGRISSER_3.BIN
set LANG3_CUE=..\cd\LANGRISSER_3.CUE

echo Extracting Disc
vcdextract --extract=. %LANG3_CUE%
pause