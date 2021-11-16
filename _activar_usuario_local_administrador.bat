@echo "Activando usuario local Administrador"
@echo off
net user Administrador Pass1234 /ACTIVE:YES
wmic useraccount where (Name='Administrador'and LocalAccount= 'True') set PasswordExpires=false
 
pause
