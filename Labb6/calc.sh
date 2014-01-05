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
    if ! [ "$number1" -eq "$number1" 2> /dev/null ];then
        printf "Need two integers\n"
        printDemand
    elif ! [ "$number2" -eq "$number2" 2> /dev/null ]; then
	printf "Nedd two integers\n"
	printDemand
    else
        printCalc
    fi
}

printDemand
#printCalc
exit 0
