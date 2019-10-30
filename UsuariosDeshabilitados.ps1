# CSVDE : comando CSVDE importa/exporta datos de un fichero csv
# -d : para meter el DN entre ""
# -f : nombre del fichero que se crea automaticamente (con ruta) 
# -r : es un filtro que trabaja con clases de LDAP
# Codigos en base 10 de UserAccountControl => https://jackstromberg.com/2013/01/useraccountcontrol-attributeflag-values/
# -l : especifica los atributos a exportar. Si no se pone exporta todos


CSVDE -d "DC=serviguide,dc=net" `
      -f C:\Temp\DisabledUsers.csv `
      -r "(|(useraccountcontrol=514)(useraccountcontrol=546)(useraccountcontrol=66050))" `
      -l "homephone, telephoneNumber, ipPhone, title, department, displayName, userPrincipalName, modifyTimeStamp" 