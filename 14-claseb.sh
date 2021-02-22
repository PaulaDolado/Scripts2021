#! /bin/bash 
#@paula asix-m01
#febrer 2021
#llistar basee
#--------------------------------------------
ERR_ARG=1
ERR_DIR=2
#validem el numero de arguments
if [ $# -ne 1 ]
then
  echo"Usage: numero de arguments no vàlid"
  echo"error $0 llista "
  exit $ERR_ARG
fi

#validem argument sigui un directori
if [ ! -d  $1]
then
  echo"Aquest argument no es un directori"
  exit $ERR_DIR
fi

#llistar el directori i numerem
dir=$1
num=1
llista_elements=$(ls $dir)
for fit in $llista_elements
do
  echo"$num: $fit"
  ((num++))
done
exit 0
