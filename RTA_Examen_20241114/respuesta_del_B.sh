#!/bin/bash

# Parámetros:
# $1: Usuario del cual se obtiene la clave.
# $2: Ruta al archivo de usuarios.

# Obtener la clave del usuario pasado como primer parámetro
CLAVE=$(getent shadow "$1" | cut -d: -f2)

# Leer el archivo de usuarios y grupos línea por línea
while IFS=',' read -r USUARIO GRUPO; do
  # Crear el grupo
  groupadd "$GRUPO"

  # Crear el usuario, asignarlo al grupo y darle la clave
  useradd -m -g "$GRUPO" -p "$CLAVE" "$USUARIO"
done < "$2"

#Primero hacer esto antes de ejecutar el Script:
#sudo mkdir -p /usr/local/bin/<en mi caso Guzman>
#sudo mv AltaUser-Groups.sh /usr/local/bin/<Guzman>/
#sudo chmod +x /usr/local/bin/<tu-apellido>/AltaUser-Groups.sh

#para verlo: ls -l /usr/local/bin/Guzman/

# para ejecutarlo:sudo /usr/local/bin/Guzman/Punto_B.sh vagrant /home/vagrant/RTA_Examen_20241114/nombre_del_archivo.txt

