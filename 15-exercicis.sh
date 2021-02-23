#! /bin/bash
# @paula ASIX M01
# Curs 2020-2021
# Febrer 2021
# Exercicis classe 23-02-2021
# -------------------------------------


#mostrar linia a linia estand + retallar 50c

llista_noms=$( cut -50c /etc/passwd )
num=1
for elem in $llista_noms
do
  echo "$num: $elem"
  ((num++))
done
exit


#programa dir dies del mes
  #validem els arguments
ERR_ARG=1
ERR_RANG=2

  if [ $# -ge 1 ]
then
    echo "Error: nºarguments incorrecte"
    echo "Usage: $0 arg insuficient"
    exit $ERR_ARG
fi
  #validem mes
mes=$1
if ! [ $mes -ge 1 -a $mes -le 12 ]
then
  echo "Error, valor argument no valid"
  echo "Usage: $0 mes (valord de [1,12]"
  exit $ERR_RANG
else #cas de no error -->dir dies mes
  case $1 in
    "1"|"3"|"5"|"7"|"8"|"10"|"12")
            echo"aquest mes té 31 dies";;
    "4"|"6"|"9"|"11")
            echo"aquest mes té 30 dies";;
    "2")
            echo"aquest mes té 28 dies";;
esac
exit 0


#comptador del 0 a n
num=$1
inici=0
while [ $num -le $inici ]
do
  echo "$num, "
  ((num++))
done
exit 0

#mostrar arguments linia a linia numerant
num=1
for arg in $*
do
  echo "$num: $arg"
  num=$((num+1))
done
exit 0


#mostrar la entrada estandard + numerant
num=1
while read -r line
do
  echo"$num: $line"
done
exit 0


