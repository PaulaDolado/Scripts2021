#! /bin/bash
# @paula ASIX M01
# Curs 2020-2021
# Febrer 2021
#  #copyfile  file[...] dirdestí
        #nº arg
        #llista arg
        #ultim arg
        #llista file
#
#carta   treball   informe   apunts
# -------------------------------------

#validem el num de arguments
ERR_ARG=1

if [ $# -lt 2 ]
then
    echo "Error: nºarguments incorrecte"
    echo "Usage: $0 arg insuficient"
    exit $ERR_ARG
fi

#llistar arguments
echo $#
echo $*
echo $# | sed -r 's/ [^ ]*$//' #ens elimina el ultim
echo $# | sed -r 's/^.* $//' #ens elimina tot fins ultim
echo $# | cut -d' ' -f1-$(($#-1))  
echo $# | cut -d' ' -f$#
#ultim argument

#---------------------------------------------
#copyfile file a dir destí
  #validem els arguments
ERR_ARG=1
ERR_NOEXIST=2
if [ $# -ne 2 ] #han de ser 2 arg degut a que el file + dir 
then
    echo "Error: nºarguments incorrecte"
    echo "Usage: $0 arg insuficient"
    exit $ERR_ARG
fi
  #validem que es un fitxer + aquest existeix
file=$1
if [ ! -e $file ]
then
  echo"Error: $file no existeix"
  exit $ERR_NOEXIST
fi
  #validem que es un directori
dir=$2
if [! -d $dir]
then
  echo"Error: $dir no es un directori"
  exit $NO_EXIST

cp -r $file /desti
