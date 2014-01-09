#!/bin/bash
# Simplified deb installer
# Version 0.1
# © Daemonicus666
# GPLv3

# Some quick explanations for things used often
# ---------------------------------------------
# trap '' INT will trap the Escape button
# if [ $? -eq 0 ] will check if it's the 'OK' button that was used
# ---------------------------------------------

pkginfo(){

    `aptitude show $(cat /tmp/pkgchoice) > /tmp/pkginfo`
    whiptail --title "Information about the selected package" --textbox /tmp/pkginfo 40 80\
        --scrolltext
    # Trap ESC
    trap '' INT
    if [ $? -eq 0 ];then
        main
    fi
}

pkginstall(){
    # Fetch all the available debs
    `ls -l /deb/ | awk '{ print $9 }' | tail -n +2 > /tmp/debs`

    showpkg=`for k in $(cat /tmp/debs); do echo $k "."; done `
    whiptail --backtitle "Available debs" --title "Choose a package" \
        --menu "Please select a package" 10 20 12 $showpkg 2> /tmp/debchoice
    Input=`cat /tmp/debchoice`
    trap '' INT
    if [ $? -eq 0 ];then
        # Try to install the selected package and redirect stderr and stdout to a temp file
        dpkg -i /deb/$Input &> /tmp/dpkgi
        # Show install/error log
        whiptail --title "Log" --textbox /tmp/dpkgi 50 80 --scrolltext
        # Trap ESC
        trap '' INT
        if [ $? -eq 0 ];then
            main
        fi
    else
        main
    fi
}

# Function pkglist - print out the list of installed packages
pkglist(){
    # Fetch the installed packages and populate a menu 
    # with the packages that were fetched.
    `dpkg -l | awk '{ print $2 }' | tail -n +7 > /tmp/listpkg`
   pkgecho=`for f in $(cat /tmp/listpkg); do echo $f "."; done `
    whiptail --backtitle "Installed packages" --title "Choose a package" \
        --menu "Please select a package." 10 90 12 $pkgecho 2> /tmp/pkgchoice
    Input=`cat /tmp/pkgchoice`
    # Trap Esc, re-route
    trap '' INT
    if [ $? -eq 0 ];then
        pkginfo
    else
        echo "LOL"
    fi
}

# A simple greeting
greetingsMenu(){
    if [ $EUID -ne 0 ];then
        whiptail --msgbox "You have to be root to run $0." 10 60
        clear
        exit 0
    else
    whiptail --backtitle "Simplified deb installer" --msgbox "Welcome to the Simplified deb installer!\nThis will make it easier for you to list installed packages, install packages and uninstall packages.\n\nFor more info, mail <nn.nn@domain.domain>" 12 60 10 2> /dev/null
    fi
    trap '' INT
}

# C-inspired main function - Present a menu
main(){
    whiptail --title "Simplified deb installer" --menu "Choose an option" 12 60 3 \
    listpkg "List installed packages" \
    installpkg "Install packages" 2> /tmp/choices
    
    trap '' INT
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
        pkginstall
         #echo "Woohoo!"
    fi
}

# Actually call functions
greetingsMenu
main
# Hide possible stderrs from the user.
clear
exit 0
