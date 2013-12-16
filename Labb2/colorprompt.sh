#!/bin/bash
color="Red"
read -t 5 -p "Write your favourite color: " color
color=${color:="Red"}
echo "\nChosen color: $color"
exit 0
