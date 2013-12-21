#!/bin/bash
printStars(){
    until [ $number -lt 0 ];do
        printf "*"
        ((number--))
    done
}

printf "How many stars? "
read number
printStars
printf "\nDone!"
exit 0
