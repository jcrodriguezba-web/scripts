#!/bin/bash


if [[ $# -ne 1 ]]
    echo "Error: se requiere un único parámetri"
    exit 1
fi

#comprovar que realmente tenemos un número
if ! [["$1" =~ ^[0-9]+$ ]]; then
    echo "error requiere número"
    exit 1
fi

echo "Vamos a calcular el sumatorio de $1"

#recoger el valor de n
n=$1
suma=0

#bucle for
for (( i=1;i<=n;i++ ))
do
    suma=$((suma+i))
done

echo "el sumatorio de $n vale $suma"
#calcular sumatorio de un numero
exit 0
