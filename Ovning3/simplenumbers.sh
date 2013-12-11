#!/bin/bash
read -p "Type a number between 1 and 10: " number
if [ $number -gt 10 ] || [ $number -lt 1 ];then
    echo "#¤%&/(!"
else
    echo "YEEHA!"
fi
exit 0
