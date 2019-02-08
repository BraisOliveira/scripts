#!/bin/sh
#Ejemplo de script sencillo de creacion de usuario

read -p "Nombre del usuario que se crea: " usuario

#if ! `test " grep "^$usuario" /etc/passwd"`
if ! [ `"grep "^$usuario" /etc/passwd` ]
  then

    read -p "DIRECTORIO particular de usuario: " directorio
    read -p "SHELL para el usuario: " shell
    read -p "Grupos SUPLEMENTARIOS para el usuario: " grupos

    useradd $usuario -m -d $directorio -s $shell -G $grupos $usuario
    tail -n 1 /etc/passwd

  else 
    echo "$usuario ya existe en el sitema"
fi

grep "^$usuario" /etc/passwd
