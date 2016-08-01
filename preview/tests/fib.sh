#!/bin/bash
c=0
a=1
b=1
read -p "Enter limit of fibonacci Series:" n
echo -n "$a "
echo -n "$b "
#Fibonacci series logic
while((c<n))
do
    c=$((a+b))
    echo -n "$c "
    a=$b
    b=$c
done
echo -e "\n"