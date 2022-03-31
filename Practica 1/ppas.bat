@echo off
SET THEFILE=c:\users\tyrant~1\docume~1\fodpra~1\practi~1\ej7.exe
echo Linking %THEFILE%
c:\dev-pas\bin\ldw.exe  -s   -b base.$$$ -o c:\users\tyrant~1\docume~1\fodpra~1\practi~1\ej7.exe link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
