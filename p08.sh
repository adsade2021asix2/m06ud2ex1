#!/bin/bash
clear

if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 4
fi

echo "Escriu el nom de l'usuari que s'esborrarà: "
read user

echo "Estas segur que vols elimirar l'usuari $user?"
read sino

if [[ $sino == "y" ]]
  then
    userdel -r $user
  else
    exit 1
fi
