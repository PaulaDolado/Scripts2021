# ! /bin/bash
# @paula M01 ASIX
# Març de 2021
# exemple de funcions
#------------------------------







# 2) -------------------------------------------------- 
# showUserGecos(login) 
# mostrar un a un els camps amb label # del GECOS 
function showUserGecos(){
 ERR_NARGS=1
 ERR_NOLOGIN=2
 OK=0
 #1) validar arg
 if [ $# -ne 1 ]; then
   echo "Error: num args incorrecte"
   echo "usage: $0 login"
   return $ERR_NARGS
 fi
 #2) validar existeix
 login=$1
 line=""
 line=$(grep "^$login:" /etc/passwd 2> /dev/null)
 if [ -z "$line" ]; then
   echo "Error: login $login inexist"
   echo "usage: $0 login"
   return $ERR_NOLOGIN
 fi
 #3) mostrar
 gecos=$(echo $line | cut -d: -f5)
 name=$(echo $gecos | cut -d, -f1)
 office=$(echo $gecos | cut -d, -f2)
 phoneOffi=$(echo $gecos | cut -d, -f3)
 phoneHome=$(echo $gecos | cut -d, -f4)
 echo "name: $name"
 echo "office: $office"
 echo "office phone: $phoneOffi"
 echo "home phone: $phoneHome"
 return 0
}
#---------------------------------------------------
#mostrar camp a camp user
 function showUser(){
 ERR_NARGS=1
 ERR_NOLOGIN=2
 OK=0
 #1) validar arg
 if [ $# -ne 1 ]; then
   echo "Error: num args incorrecte"
   echo "usage: $0 login"
   return $ERR_NARGS
 fi
 
 #2) validar existeix login
 login=$1
 line=""
 line=$(grep "^$login:" /etc/passwd 2> /dev/null)
 if [ -z "$line" ]; then
   echo "Error: login $login inexist"
   echo "usage: $0 login"
   return $ERR_NOLOGIN
 fi
 
 #3) mostrar
 uid=$(echo $line | cut -d: -f3)
 gid=$(echo $line | cut -d: -f4)
 gecos=$(echo $line | cut -d: -f5)
 home=$(echo $line | cut -d: -f6)
 shell=$(echo $line | cut -d: -f7)
 echo "login: $login"
 echo "uid: $uid"
 echo "gid: $gid"
 echo "home: $home"
 echo "shell: $shell"
 return 0
}

function hola(){
  echo "hola"
  return 0
}

function dia(){
  date
  return 0
}

function suma(){
  echo $(($1+$2))
  return 0	
}

#----------------------------------------
#Prova classe

function suma(){
  echo "La suma és: $(($1+$2))"
  return 0
}

function dia(){
  date
  return 0
}
