#!/bin/bash

#Taking input
read -p "Enter Number:" number

#Outer loop for printing number of rows in pyramid
for((row=1;row<=number;row++))
do

    #Loop for printing required spaces
    for((spaces=row;spaces<=number;spaces++))
    do
        echo -ne " "
    done

    #Loop for printing 1st part
    for((j=1;j<=row;j++))
    do
        echo -ne "$j"
    done

    #Loop for printing 2nd part
    for((l=(row-1);l>=1;l--))
    do
        echo -ne "$l"
    done

    #echo for printing new line
    echo
done