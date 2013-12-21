#!/bin/bash

printCalc(){
    sum=$(($number1+$number2))
    printf "The sum is: $sum \n"
    quot=$(($number1/$number2))
    printf "The quotient is: $quot \n"
    sub=$(($number1-$number2))
    printf "The subtraction is: $sub \n"
    prod=$((number1*$number2))
    printf "The product is: $prod \n"
}

printDemand(){
    read -p "Enter an integer: " number1
    read -p "Enter another integer: " number2
    if [[ "$number1" != [0-9] ]] && [[ "$number2" != [0-9] ]];then
        printf "Need two integers\n"
        printDemand
    else
        printCalc
    fi
}

printDemand
#printCalc
exit 0
