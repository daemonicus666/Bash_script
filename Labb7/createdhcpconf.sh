#!/bin/bash
File="$HOME/dhcpd.conf"

question(){
    dialog --backtitle "DHCPD configuration" --inputbox "$1" 10 60 \
        2> /tmp/dhcpd_question
    # Borrowed this from JB, thanks! :)
    if [ $? -ne 0 ];then
        echo "Quitting.."
        exit 1
    fi
    Input=`cat /tmp/dhcpd_question`
}

question "Enter subnet"
Subnet=$Input

question "Enter netmask"
Netmask=$Input

question "Enter start of range"
StartRange=$Input

question "Enter end of range"
EndRange=$Input

question "Enter nameserver/nameservers"
Nameservers=$Input

question "Enter router/routers"
Router=$Input

dialog --backtitle "DHCPD configuration" --menu "Choose DDNS update style" 10 60 3 \
      none "None" ad-hoc "Ad-Hoc" interim "Interim" 2> /tmp/dhcpd_question
  Input=`cat /tmp/dhcpd_question`
Style=$Input

question "Enter default lease time (seconds)"
DefaultLease=$Input

question "Enter max lease time (seconds)"
MaxLease=$Input

printf "subnet $Subnet netmask $Netmask {\n" > $File
printf "range $StartRange $EndRange;\n" >> $File
printf "option domain-name-servers ${nameservers};\n" >> $File
printf "option routers ${Router};\n" >> $File
printf "ddns-update-style ${Style};\n" >> $File
printf "default-lease-time ${DefaultLease};\n" >> $File
printf "max-lease-time ${MaxLease};\n" >> $File
printf "}\n" >> $File

printf "Done!"

dialog --infobox "DHCPD generated! You can find it in ~/" 10 60

sleep 1
clear
exit 0
