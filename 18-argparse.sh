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

file=''      #|
num=''       #|creem llistes
opcions=''   #|guardar info
arguments='' #|

#lleguim mostrem arguments
while [ -n  "$1" ]
do
  case $1 in     #diferenciar op + argum
    '-b'|'-c'|'-e')
      opcions="$opcions $1";;
    '-a')
       file=$2
       shift;; #saltem un camp
    '-d')
       nums=$3
       shift;;
    *)
      echo "arguments: $arguments $1";;
  esac
  shift #desplaçcar args
done
echo "Opcions: $opcions"
echo "Arguments: $arguments"
echo "File: $file"
echo "Numeros: $nums"
exit 0
