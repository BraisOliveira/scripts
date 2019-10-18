@echo off
echo ------------------------------------------------------------------------------
echo Utilidad para la obtencion sencilla de claves de red  inalambricas en Windows
echo Brais Oliveira Sanjurjo 												
echo braisoliveira@protonmail.com
echo ------------------------------------------------------------------------------

rem net start Wlansvc

title WiFiKeyMiner09
color 70

:inicio
  set wifi=
  set sc=
  
  net wlan show profile
  
echo Escoja una de las redes listadas para extraer la contraseña:
 set /p wifi=
echo Se creara un archivo de texto plano en su escritorio claves.txt
 
cd %userprofile%\Desktop
netsh wlan showprofile name=%wifi% key=clear | find "Contenido de la clave" >> claves.txt
type claves.txt
 
echo Pulsa C para Continuar o cualquier otra tecla para salir: 
 set /p sc= 
 
if %sc%==c goto inicio
if %sc%==C (
  goto inicio
	) else (
    	echo Hasta la proxima    
			)   
pause
 
