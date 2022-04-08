#!/bin/bash
clear

if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 4
fi

echo "Escriu el servei a deshabilitar: "
read servei

systemctl disable $servei
systemctl status $servei

echo "Vols continuar? "
read continuar

if [[ $continuar == "c" ]]
  then
    ./p03.sh
  else
    exit 10
fi
