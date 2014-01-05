#!/bin/bash
dialog --menu "Choose a browser to start" 12 60 2 \
    firefox "Firefox" opera "Opera" 2> /tmp/browserchoice
$Browser=`cat /tmp/browserchoice`
dialog --infobox "Starting up $Browser.." 10 60
sleep 5
clear
exit 0
