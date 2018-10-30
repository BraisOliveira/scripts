@echo off
:inicio
set edad=
set /p edad="--PON TU EDAD, 999 PARA SALIR-->"
if %edad% equ 999 ( set edad=
					goto :eof )
if %edad% geq 18 ( echo "MAYOR DE EDAD" ) else ( echo "MENOR DE EDAD" )
goto :inicio 
pause
