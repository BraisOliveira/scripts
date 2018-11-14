@echo "Activando usuario local Administrador"
@echo off
net user Administrador Sgadmin123 /ACTIVE:YES
wmic useraccount where (Name='Administrador'and LocalAccount= 'True') set PasswordExpires=false
 
pause
