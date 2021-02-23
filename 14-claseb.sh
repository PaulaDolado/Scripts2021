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
for mydir in $*
do
  if [ ! -d  $1]
  then
    echo"Aquest argument no es un directori"
    echo"Usage: $0 dir"
    ok= $ERR_DIR
    fi

#llistar el directori i numerem
dir=$1
num=1
llista_elements=$(ls $dir)
for fit in $llista_elements
do
  if [ -h $mydir/$fit ]
  then
    echo -e "\t $fit es un link"
  elif [ -f $mydir/$fit ]
  then
    echo -e "\t $fir es un regular file"
  elif [ -d $mydir/$fit ]
  then
    echo -e "\t $fit es un director"
  else
    echo -e "\t $fit es un altre "
 exit 0
