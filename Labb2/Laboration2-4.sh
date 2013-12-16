#!/usr/bin/env bash
color="Red"
read -t 5 -p "Skriv din favoritfärg: " color
color=${color:="Red"}
echo $color
exit 0
