@echo off
rem script para crear directorios 

set /p directorio="---- ESCRIBE EL NOMBRE DEL DIRECTORIO QUE SE CREA ---->"
 
if exist %directorio% ( echo YA EXISTE %directorio% ) else ( mkdir %directorio% echo CREADO dir %directorio% )

echo ===========================================
pause