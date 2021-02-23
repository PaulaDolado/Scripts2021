
#! /bin/bash 
#@paula asix-m01
#febrer 2021
#adivinar tipus fitxer
    #dir
    #link
    #regular file
#-------------------------------------------------
ERR_ARG= 1
ERR_NOEXIST=2
#validem els arguments
if [ $# -ne 1 ]
then
  echo "ERROR: num args incorrecte"
  echo "usage: $0 fit"
  exit $ERR_ARGS
fi
#validar tipus
fit=$1
if [ ! -e $fit ]; then
  echo "Error: $fit no existeix"
  exit $ERR_NOEXIST
elif [ -h $fit ]; then 
  echo "$fit symbolic link" #validem si es un link
elif [ -f $fit ]; then
  echo "$fit regular file " #validem si es un regular file.
elif [ -d $fit ]; then
  echo "$fit directori"  #validem si es directori
else
  echo "$fit es una altre cosa"
fi
exit 0
