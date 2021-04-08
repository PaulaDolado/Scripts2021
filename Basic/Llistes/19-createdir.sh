# !/bin/bash
# @paula ASIX M01-ISO
# Febrer 2021
# Descripció:                             Estructura:
# 1 o + argum --------------------------| validar args for
# voler crear-ho --> si stdout  
#                --> no stderr----------| bucle for cada elem llista
# ordre mkdir no sortida                  echo elemnts llista
# 0 per tots= perfecte
# si hi ha un malament-->error
#-------------------------------------

ERR_ARG=1
STATUS=0

#validem numero arguments [ha de ser != 0]
if [ $# -eq 0 ]
then
    echo "Error: nºarguments incorrecte"
    echo "Usage: $0 arg insuficient"
    exit $ERR_ARG
fi

#mirem cada elemnt de la llista
for dir in $*
do
  mkdir -p $dir &> /dev/null #p--> crea tota la ruta
  if [ $? -eq 0 ] #saber si l'ordre anterior ha funcionat correctement
  then
    echo "Creat: $dir"
      else
    echo "No creat: $dir" >> /dev/stderr
    STATUS=2
   fi
done
exit $STATUS

