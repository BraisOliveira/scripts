@echo off 
title Test Red

if exist %USERPROFILE%\Desktop\ (
    color 04
    echo Iniciado el proceso

    ipconfig /all >> %USERPROFILE%\Desktop\LOG_R.txt
    echo ipconfig finalizado

    ping empresas.mundo-r.com >> %USERPROFILE%\Desktop\LOG_R.txt 
    echo ping finalizado

    tracert empresas.mundo-r.com >> %USERPROFILE%\Desktop\LOG_R.txt 
    echo tracert finalizado

    netstat -nr >> %USERPROFILE%\Downloads\LOG_R.txt
    echo netstat finalizado

    echo El reporte del proceso se encuentra en el Escritorio del usuario -> LOG_R


pause ) else (
    color 07
    echo Iniciado el proceso

    ipconfig /all >> %USERPROFILE%\Downloads\LOG_R.txt
    echo ipconfig finalizado

    ping empresas.mundo-r.com >> %USERPROFILE%\Downloads\LOG_R.txt 
    echo ping finalizado

    tracert empresas.mundo-r.com >> %USERPROFILE%\Downloads\LOG_R.txt 
    echo tracert finalizado

    netstat -nr >> %USERPROFILE%\Downloads\LOG_R.txt
    echo netstat finalizado

    echo El reporte del proceso se encuentra en la carpeta Descargas del usuario -> LOG_R

pause )