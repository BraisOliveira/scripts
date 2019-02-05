#!/bin/bash

read -p "USUARIO al que se le modifican los grupos: " usuario
read -p "Lista de GRUPOS (separados por comas y sin espacios): " grupos

groups $usuario
usermod -G $grupos $usuario
echo "Asi quedan sus grupos ahora"
groups $usuario

echo "******************************************************************"
