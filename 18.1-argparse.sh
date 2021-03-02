
#! /bin/bash
# @paula ASIX M01
# Curs 2020-2021
# Febrer 2021
# argum|opcions(valor)
# [-afile -b -c -dnum -e] arg[...]
#  -----        -----
# file[]          num[] --->#file
                            #num
                            #opcions
                            #arguments
# -------------------------------------

#creem llistes per anar guardar la informació
file=''
num=''
opcions=''
arguments=''
max=''
min=''
#lleguim mostrem arguments 
while [ -n  "$1" ]
do 
  #diferenciar de opcio a argument
  case $1 in    
    '-b'|'-c'|'-e')
      opcions="$opcions $1";;
    '-a')
       file=$2
       shift;; 
    '-d')
       min=$3
       max=$4
       shift
       shift;;
    *)
      echo "arguments: $arguments $1";;
  esac
  shift #desplaçcar args
done
echo "Opcions: $opcions"
echo "Arguments: $arguments"
echo "File: $file"
echo "Numeros Màxim: $max Numero mínim: $min"
exit 0
