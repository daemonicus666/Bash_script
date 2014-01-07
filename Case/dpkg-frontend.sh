#!/bin/bash
# Simplified deb installer
# Version 0.1
# © Daemonicus666
# GPLv3


# Simplify a binary
DPKG=/usr/bin/dpkg

# Function pkglist - print out the list of installed packages
pkglist(){
    # Fetch the installed packages
    `dpkg -l | awk '{ print $2 }' | tail -n +7 > /tmp/listpkg`

    dialog --textbox /tmp/listpkg 20 50
    if [ $? -eq 0 ];then
        main
    fi
}

# A simple greeting
greetingsMenu(){
    whiptail --backtitle "Simplified deb installer" --msgbox "Welcome to the Simplified deb installer!\nThis will make it easier for you to list installed packages, install packages and uninstall packages.\n\n \
        For more info, mail foo@bar.se" 12 60 10 2> /dev/null
}

# C-inspired main function - Present a menu
main(){
    whiptail --title "Simplified deb installer" --menu "Choose an option" 12 60 3 \
    listpkg "List installed packages" \
    installpkg "Install packages" 2> /tmp/choices
    
    # If the user pressed abort
    if [ $? -eq 1 ];then
        clear
        exit 0
    fi
    
    # Capture the choice
    Input=`cat /tmp/choices`
        
    # Initiate things depending on the choice made
    if [ $Input == "listpkg" ];then
        pkglist
     elif [ $Input == "installpkg" ];then
        echo "Woohoo!"
    fi
}

# Actually call functions
greetingsMenu
main

exit 0
