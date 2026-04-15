#!/bin/bash
function usage(){
    echo "Usage ${0}"
    echo 
    echo "has de ser root"
    echo "l'usuari no l'has de repetir"
    exit 1
}
#Script per crear un usuari

#primer comprobam si som l'usuari root
if [[ ${UID} -ne 0 ]]
then
    usage
fi

read -p "Inrodueix el nom complet " COMMENTS
#demanam el nom de l'usuari
read -p "Introdueix el nom d'usuari: " USER_NAME
#generarem aleatoriament
PASSWORD=$(date +%s%N | sha256sum | head -c10)

#crearem l'usuari
useradd -m -c "${COMMENTS}" ${USER_NAME} &> /dev/null
#control de la darrera comanda
echo ${?}

if [[ ${?} -ne 0 ]]
then
    echo "Errada creant l'usuari"
    exit 1
fi

#canvi de password
echo "${USER}:${PASSWORD}" | chpasswd
#comprovam si el canvi de password ha anat bé
if [[ ${?} -ne 0 ]]
then
    echo "Errada canviant password"
    exit 1
fi

#fer caducar el password
passwd -e ${USER_NAME}

#informarem del que s'ha creat
echo "Usuari creat: ${USER_NAME}"
echo "password generat: ${PASSWORD}"
echo "HostName ${HOSTNAME}"

exit 0