#!/bin/bash
read -p "Type two integers: " number1 number2
summa=$(( number1+number2 ))
echo "$number1 + $number2 = "$summa
summa2=$(( number1-number2 ))
echo "$number1 - $number2 = "$summa2
summa3=$(( number1*number2 ))
echo "$number1 * $number2 = "$summa3
summa4=$(( number1%number2 ))
echo "$number1 / $number2 = "$summa4
