#!/bin/bash
clear
echo "Simple math\n------------------------------------------"
read -p "Type two numbers, separated with space: " number1 number2
if [ $number1 -ge $number2 ]; then
    echo "Number one greater than or equal to Number two!"
elif [ $number1 -le $number2 ]; then
    echo "Number one is less than or equal to Number two!"
fi
sleep 2
clear
exit 0
