#!/bin/bash

echo "Iniciando..."
counter=0

while true
do
    echo "$counter"
    counter=$((counter+1))
    echo "Deseja continuar? (S/n): "
    read answer
    if [ "$answer" == "s" ]; then
        echo "$answer"
    else
        break
    fi
done
