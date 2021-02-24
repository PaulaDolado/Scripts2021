#! /bin/bash
# @paula ASIX M01
# Curs 2020-2021
# Febrer 2021
# [ -a -b -c -d -f -g ]args[...]
# 1 opcions .......... -a -b
# 2 arguments ........ arg1 arg2
# -------------------------------------

#no validem --> suposem que esta correcte

#validem els arguments i les opcions
opcions=""
arguments=""

for arg in $*
do
  case $arg in
    '-a'|'-b'|'-c'|'-d'|'-f'|'-g')
      echo"opcions: $opcions $arg";;
    *)
      echo"arguments: $arguments $arg";; 
  esac
done
echo"opcions: $opcions"
echo"arguments: $arguments"
exit 0
