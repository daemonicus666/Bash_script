#!/bin/bash
read -p "Choose a number between 10 and 100: " number
if [ "$number" -lt 10 ] || [ "$number" -gt 100 ];then
    printf "Does not compute!\n"
else
    until [ "$number" -eq 1 ];do
        printf "$number\n"
        sleep 0.05
        clear
        number=$[ number -1 ]
    done
fi
printf "Done!"
sleep 1
clear
exit 0
