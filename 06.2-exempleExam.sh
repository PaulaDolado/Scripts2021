#!/bin/bash
#@paula ASIX M01-ISO
#Febrer 2021
#Descripció: Dir si està aprovat o no
#-------------------------------------
ERR_ARGS=1
ERR_VAL=2 #canvi num pq tipus diferent, sortida tmb

#error: validem arguments
if [ $# -ne 2 ]
then
    echo "Error: num arguments incorrecte"
    echo "Usage: $0 nota"
    exit $ERR_ARGS
fi

#error: validem valors nota
nota=$1
if [ $nota -ge 0 -a $nota -le 10 ]
then
    echo "error nota no vàlida"
    echo "nota pren valor [0,10]"
    exit $ERR_VAL 
 fi 
 
if [ $nota -ge 5 ]
then
    echo "examen aprovat"
elif [ $nota -ge 6 -a $nota -lt 8 ]
then
    echo "examen aprovat amb notable"
elif [ $nota -gt 8 -a $nota -lt 10 ]
    echo "examen aprovat amb excelent"
else
    echo "examen suspés"
fi

exit 0
