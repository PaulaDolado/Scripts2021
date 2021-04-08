# ! bin/bash
# @paula ASIX M01
# febrer 2021
#  
# FUNCIONS	
#--------------------------------------------------



#--------------------------------------------------
   #Descripció
   #funció que crea una altre funció

function crearEscol(){

  for classe in $*
  do
    crearClasse $classe
  done


}
#------------------------------------------------------
   #Descripció:
   #programa crear noms de ususari--> 5 users
   #

function creaClasse(){

  classe=$1
  PASSD="alum"
  llista_noms=$(echo ${classe}{00..03}) 
  
  for user in $llista_noms
  do
    echo"$user:$PASSWD" | chpasswd
    #chpasswd < file
    #echo -e "alum" | passwd --stdin $user &> /dev/null
  
  done

}



#---------------------------------------------------
  # Descripció:
  # funcio que -llisti grups principals (gid)
  #            - agrupi x gid
  #            - mostri els users que la tenen

function showALLgroups(){

MIN_USERS=2

  llista_gids=$(cut -d: -f4 /etc/passwd | sort -n | uniq )
  
  for gid in $llista_gids
  do
     count=$(grep"^[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd |wc -l)
     
     if [$count -ge $MIN_USERS ];
     then
       gname=$(grep "^[^:]*:[^:]*:$gid:" /etc/group | cut -d: -f1 )
     fi
   
    echo "$gname($gid):$count"
    grep "^[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd | sort | cut -d: -f1,3,7 | sed -r 's/^(.*)$/\t\1/'
  
  done
 
  return 0
}
