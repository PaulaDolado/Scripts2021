# ! /bin/bash
# @paula ASIX M01-ISO
# Curs 2019 - 2020
# Descripció: Exercicis scripts Administració de disc
#--------------------------------------------------------


#----------------------------------------------------------
#3
# Rep com a argument nom fitxer --> lògin per línia.
# Mostrar l'ocupació de disc de cada usuari usant fsize. 
# Verificar que es rep un argument i que és un regular file.
function loginfile(){
  fileIn=$1
  while read -r login
  do
     fsize $login
  done < $fileIn

} 


#----------------------------------------------------------
#2
# Rep logins i per a cada login --> ocupació de disc del home de l'usuari== fsize.
# Verificar que es rep almenys un argument + verificar si és un login vàlid ->no, error

function loginargs(){
  for login in $*
  do
     fsize $login
  done

}

#----------------------------------------------------------
#1
#)fsize Donat un login calcular amb du l'ocupació del home 
#de l'usuari. Cal obtenir el home del /etc/passwd

function fsize(){
  #hauriem de validar els arguments aqui
  login=$1
  home=""
  if [ -z "$home" ];
  then
     echo "ERR: user $login not exists" >> /dev/stderr
     return 1
  fi
  du -sh $home 2> /dev/null
  return 0


}
