
#! /bin/bash 
#@paula asix-m01
#febrer 2021
#adivinar tipus fitxer
    #dir
    #link
    #regular file
#-------------------------------------------------
ERR_ARG= 1
#validem els arguments
if [ $# -ne 1 ];
	echo "error: nº arguments incorrecte, nomes 1"
	echo "usage: $0 edat"
	exit $ERR_ARG
fi

#validem si es directori

#validem si es un link

#validem si es un regular file.
