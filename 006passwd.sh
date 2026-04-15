#!/bin/bash

#mostram diverses maneres de generar passwords

#password com número aleatori
PASSWORD=${RANDOM}
echo "password com número aleatori"


PASSWORD=${RANDOM}${RANDOM}${RANDOM}
echo "password com a tres números aleatoris: ${PASSWORD}"


#password amb sha2556sum
PASSWORD=$(date +%s%N | sha256sum | head -c10)
echo "${PASSWORD}"