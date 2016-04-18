#!/bin/bash

echo "Iniciando..."
counter=0

while [ $counter -le 10 ]
do
    echo "$counter"
    sleep 0.25
    (( counter++ ))
done
