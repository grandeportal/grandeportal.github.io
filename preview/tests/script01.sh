#!/bin/bash
# type source script01.sh

echo "Iniciando..."
counter=0
answer="s"

while [ "$answer" == "s" ]
do
    echo "$counter"
    counter=$((counter+1))
    read -p "Deseja continuar? (S/n): " answer
    answer=${answer:-s}
    if [ "$answer" != "s" ]; then break; fi
done
