#! /bin/bash
# paula ASIX M01
#febrer 2021
#exemple if
# $programa edat
#--------------------
if [ $# -ne 1 ];
	echo "error: nº arguments incorrecte, nomes 1"
	echo "usage: $0 edat"
	exit 1
fi

echo $1
exit 0
