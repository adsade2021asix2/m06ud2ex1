#!/bin/bash
clear

if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 4
fi

function comprova {
  if [ -d /mnt/cpseg ];
    then
      echo "El directori /mnt/cpseg existeix"
    else
      mkdir /mnt/cpseg
  fi
}

comprova

function copia {
  nom=$(date +"%Y%m%d%X")
  gzip -c /etc/crontab /etc/hosts > /mnt/cpseg/backup$nom.tar.gz
}
copia

function esborra {
  rm /mnt/cpseg/*
}


echo "Vols esborrar el contingut de /mnt/cpseg? "
read elimina

if [[ $elimina == "s" ]]
  then
    esborra
    echo "Vols continuar? "
    read continuar
    if [[ $continuar == "s" ]]
      then
        ./p12.sh
      else
        exit 0
    fi
  else
    echo "Vols continuar? "
    read continuar
    if [[ $continuar == "s" ]]
      then
        ./p12.sh
      else
        exit 0
    fi
fi
