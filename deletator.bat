@echo off

rem script para eliminaren usuarios xenericos do sistema
rem Brais Oliveira 

net user

set /p nome="Nome do usuario que imos eliminar: "
set /p dende="Numero inicial: "
set /p ate="Numero do derradeiro usuario: "

for /l %%i in (%dende%,1,%ate%) do (net user %nome%%%i /delete)I

net user

pause
