#! /bin/bash 
#@paula asix-m01
#febrer 2021
#1r exemple script
#-------------------------------------------------
echo "hello world"
echo 'bon dia avui plou'
nom='paula'
edat='18'
echo $nom $edat
echo -e "nom: $nom\n edat: $edat"
echo -e 'nom: $nom\t edat: $edat'
uname -a
uptime
echo $SHELL
echo $SHLVL
#read data1 data2
#echo -e "$data1 \n $data2"
echo $((edat*2))
exit 0
