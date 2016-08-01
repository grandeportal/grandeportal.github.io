#!/bin/bash

soma(){
    a=$1
    b=$2
    echo `expr $a + $b`
}

read -p 'Digite um número: ' x
read -p 'Digite outro número: ' y
soma $x $y
