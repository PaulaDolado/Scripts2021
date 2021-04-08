#!/bin/bash
#@paula ASIX M01-ISO
#Febrer 2021
#Exemple if: indica si es major d'edat
#$ prog edat
#-------------------------------------

if [ $# -ne 1 ]
then
        echo "Error: nºarguments incorrecte"
        echo "Usage: $0 edat"
        exit 1
fi

if [ $1 -lt 18 ]
then
    echo "Error: edat inferior a 18"
    exit 1
fi 


exit 0

echo $1
