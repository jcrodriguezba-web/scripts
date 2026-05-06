#!/bin/bash
#factorial de un número

if [[ $# -ne 1 ]]
    echo "Error: se requiere un único parámetri"
    exit 1
fi

#comprovar que realmente tenemos un número
if ! [["$1" =~ ^[0-9]+$ ]]; then
    echo "error requiere número"
    exit 1
fi

n=$1
echo "vamos a calcular el factorial de $n"
#recoger el valor de n
n=$1
producto=1

#bucle for
for (( i=1;i<=n;i++ ))
do
    producto=$((producto*i))
done

echo "el factorial de $n es $producto"
