# ! /bin/bash
# @paula ASIX M01-ISO
# Curs 2019 - 2020
# Descripció: Exercicis scripts Administració Users


# 10) -----------------------------------
# showAllShells
# mostrar un informe de tots els shells i
# els usuaris que hi pertanyen
# --------------------------------------
function showAllShells(){
  llista_shells=$(cut -d: -f7 /etc/passwd \
	              | sort | uniq )
  for shell in $llista_shells 
  do
    num=$(grep ":$shell$" /etc/passwd | wc -l)
    if [ $num -gt 2 ] ; then          
      echo "$shell($num):" 
      grep ":$shell$" /etc/passwd \
        | cut -d: -f1,3,4 \
        | sort -t: -k2g,2 \
        | sed -r 's/^(.*)$/\t\1/'     
    fi
  done  
}

# 9) -----------------------------------
# showAllGroups 
# mostrar un informe de tots els grups i
# els usuaris que hi pertanyen
# --------------------------------------
function showAllGroups(){
  llista_gids=$(cut -d: -f4 /etc/passwd \
    | sort -n | uniq)
  for gid in $llista_gids
  do
    num=$(grep "^[^:]*:[^:]*:[^:]*:$gid:" \
	    /etc/passwd | wc -l)
    if [ $num -ge 2 ]; then
      gname=$(grep "^[^:]*:[^:]*:$gid:" /etc/group | cut -d:1 -f1)
      echo "$gid($gname)"
      grep "^[^:]*:[^:]*:[^:]*:$gid:" \
	 /etc/passwd | cut -d: -f1,3,7 \
	 | sort | sed -r 's/^(.*)$/\t\1/' 
   fi
  done
}


# 7) -----------------------------------
# showUserIN 
# mostrar un a un les dades dels usuaris 
#rebuts per stdin
# --------------------------------------
function showGroupMainMembers(){
  ERR_NARGS=1
  ERR_NOGNAME=2
  Ok=0
  #1) validar arg
  if [ $# -ne 1 ]; then
    echo "Error: num args incorrecte"
    echo "usage: $0 gname"
    return $ERR_NARGS
  fi
 #2) validar existeix
 gname=$1
 gid=""
 gid=$(grep "^$gname:" /etc/group | cut -d: -f3)
 if [ -z "$gid" ]; then
   echo "Error: login $gname inexist"
   echo "usage: $0 gname"
   return $ERR_NOGNAME
 fi
 #3) filtrar  
 echo "llistat grup: $gname($gid)"
 grep "^[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd \
  | cut -d: -f1,3,6,7 | sort -k2g,2 \
  | sed 's/:/  /g' | tr '[a-z]' '[A-Z]' \
  | sed -r 's/^(.*)$/\t\1/'
}



# 6) -----------------------------------
# showUserIN 
# mostrar un a un les dades dels usuaris 
#rebuts per stdin
# --------------------------------------
function showUserIn(){
  status=0
  while read -r login
  do
    line=$(grep "^$login:" /etc/passwd 2> /dev/null)
    if [ $? -ne 0 ]; then
      echo "Err: login $login inei" >> /dev/stderr
      status=$((status+1))
    else
      uid=$(echo $line | cut -d: -f3)
      gid=$(echo $line | cut -d: -f4)
      gname=$(grep "^[^:]*:[^:]*:$gid:" /etc/group | cut -d: -f1)
      gecos=$(echo $line | cut -d: -f5)
      home=$(echo $line | cut -d: -f6)
      shell=$(echo $line | cut -d: -f7)
      echo "$login $uid $gname($gid) $home $shell"
    fi
  done
  return $status
}

# 5) -----------------------------------
# showUserlist(login[...])
# mostrar un a un les dades dels usuaris 
# --------------------------------------
function showUserList(){
 ERR_NARGS=1
 status=0
 #1) validar arg
 if [ $# -lt 1 ]; then
   echo "Error: num args incorrecte"
   echo "usage: $0 login[...]"
   return $ERR_NARGS
 fi
 login_list=$*
 for login in $login_list
 do
  line=$(grep "^$login:" /etc/passwd 2> /dev/null)
  if [ -z "$line" ]; then
   echo "Err: login $login inei" >> /dev/stderr
   status=$((status+1))
  else
   uid=$(echo $line | cut -d: -f3)
   gid=$(echo $line | cut -d: -f4)
   gname=$(grep "^[^:]*:[^:]*:$gid:" /etc/group | cut -d: -f1)
   gecos=$(echo $line | cut -d: -f5)
   home=$(echo $line | cut -d: -f6)
   shell=$(echo $line | cut -d: -f7)
   echo "login: $login"
   echo "uid: $uid"
   echo "$gname($gid)"
   echo "home: $home"
   echo "shell: $shell"
  fi
 done
 return $status
}




# 4) -----------------------------------
# showUserGname(login)
# mostrar un a un els camps amb label
# ampliat mostrant gname
# --------------------------------------
function showUserGname(){
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
 gname=$(grep "^[^:]*:[^:]*:$gid:" \ 
	 /etc/group | cut -d: -f1)
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



# 3) -----------------------------------
#showGroup(gname)
# mostrar un a un els camps amb label 
# del grup
# --------------------------------------
function showGroup(){
ERR_NARGS=1
 ERR_NOGNAME=2
 OK=0
 #1) validar arg
 if [ $# -ne 1 ]; then
   echo "Error: num args incorrecte"
   echo "usage: $0 gname"
   return $ERR_NARGS
 fi
 #2) validar existeix
 gname=$1
 line=""
 line=$(grep "^$gname:" /etc/group 2> /dev/null)
 if [ -z "$line" ]; then
   echo "Error: gname $gname inexist"
   echo "usage: $0 gname"
   return $ERR_NOGNAME
 fi
 #3) mostrar
 gid=$(echo $line | cut -d: -f3)
 userList=$(echo $line | cut -d: -f4)
 echo "gname: $gname"
 echo "gid: $gid"
 echo "userList: $userList"
 return 0
}

# 1) -----------------------------------
# showUser(login)
# mostrar un a un els camps amb label
# --------------------------------------
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
