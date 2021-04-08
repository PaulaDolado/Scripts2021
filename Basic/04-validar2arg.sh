#!/bin/bash
#@paula ASIX M01-ISO
#Febrer 2021
#$ bash 04-validar-arguments.sh arg1 arg2
#-------------------------------------
#Validem si te 2 arguments exactament
if [ $# -ne 2 ]
then
  echo "Error: numero arguments incorrecte"
  echo "Usage: $0 arg1 arg2"
  exit 1
fi

# 2) Xixa
echo "Els arguments són: $1, $2"
exit 0

