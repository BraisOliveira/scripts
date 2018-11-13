@echo off
rem ::list /format
rem script para la creacion rapida de usuarios genericos
rem BRAIS OLIVEIRA

set /p nombre="Nombre de los usuarios: "
set /p desde="Numero inicial: "
set /p hasta="Ultimo usuario: "

for /l %%v in (%desde%,1,%hasta%) do (net user %nombre%%%v %nombre%%%v /add
wmic useraccount where name="%nombre%%%v" set passwordexpires=false)

net user 
pause
