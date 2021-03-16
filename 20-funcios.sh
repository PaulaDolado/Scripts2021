# ! /bin/bash
# @paula M01 ASIX
# Març de 2021
# exemple de funcions
#------------------------------
ERR_ARG=1

#mostrar camp a camp user

function showuser(){
  #validem que rep1 arg
if [ $# -ne 1 ]
then
  echo "Error: número args no vàlid"
  echo "usarge: $0 dir"
  exit $ERR_ARG
fi
  #validem existeix user
user=$1
if [ user -  ]

#mostrem camp a camp
while read

#---------------------------
#Prova classe

function suma(){
  echo "La suma és: $(($1+$2))"
  return 0
}

function dia(){
  date
  return 0
}
