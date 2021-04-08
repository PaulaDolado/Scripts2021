#! /bin/bash 
#@paula asix-m01
#febrer 2021
#mostrar 10 primers nums
#exemples contadors while
        #for: millor mecanisme iterar tota llista arg 1a1
                #for arg in $*  
        #mostrar arguments  |
        #mostrar arguments  | --> while + shift : mostrar arguments iterar volent saltarnos 1
        #mostrar arguments  |
        #comptador decreixent fns 10
        #comptador creixent fins 10
#-------------------------------------------------

#mostrar entrada estandard numerada y en mayús
num=1
while  read -r line
do
        echo "$num: $line" | tr '[a-z]' '[A-Z]'
        ((num++))            #cut -c60--> si volguesim nomes els primers 60 caracters 
done
exit 0
#--------------------------------------------------
#mostrar estrada estandard fins paraula fi
read -r line
while [ "$line" != "FI" ]
do
        echo "$line"
        read -r line
done
exit 0

#--------------------------------------------------
#numerar  entrada estandard
num=1
while read -r line
do
        echo "$num: $line"
        num=$((num+1))
done
exit 0

#--------------------------------------------------
#mostrar entrada estandard  liniaa linia [basic]
while read -r line 
do
        echo $line 
done
exit 0

#--------------------------------------------------
#mostrar els arguments
num=1
while [ -z "$#" ]
#mostrar els arguments
num=1
while [ -z "$#" ]
do
        echo"$num: $1, $#, $*"  
        num=$((num+1))
        shift
done
exit 0

#--------------------------------------------------
#mostrar els arguments
num=1
while [ -n "$1" ]
do
        echo"$num: $1, $#, $*"  #seguiment: x interacció
        num=$((num+1))          #que hi ha pos1, num args, com queda
        shift                   #segueix decreixent
done
exit 0

#--------------------------------------------------
#mostrar els arguments
while [ -n "$1" ]
do
        echo "$1 $#: $*"
        shift  #desplaçament a la esquerra
done
exit 0

#--------------------------------------------------
#comptador recreixent n -0
MIN=10
num=1

while [ $num -ge $MAX ]
do
        echo -n "$num"
        ((num--))
done
exit 0

#--------------------------------------------------
#comtador del 1 al 10
MAX=10
num=1

while [ $num -le $MAX ]
do
        echo"$num"
        ((num++))
done
exit 0
