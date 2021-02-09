#!/bin/bash
#@paula ASIX M01-ISO
#Febrer 2021
#Descripció: Dir si està aprovat o no
#-------------------------------------
#Validem la nota

if [ $# -ne 2 ]
then
    echo "Error: num arguments incorrecte"
    echo "Usage: $0 nota"
    exit 1
fi

#Validem la nota: 0 a 10
if [ $1 -lt 5 ]
then
    echo "examen suspes"
    exit 1
fi 

if [ $1 -ge 5 ]
then
    echo "examen aprovat"
    exit 1
fi 


exit 0

echo $1
