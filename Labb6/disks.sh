#!/bin/bash

warningRate=80

# Get disks
for dev in `df -H | awk '{ print $6 }' | egrep '[\/]'`;do
    Disk[$Nr]=$dev
    ((Nr++))
done

# Get disk usage
for percent in `df -H | awk ' { print $5 }' | egrep '[0-9]' | sed 's/̣\%//g'`;do
    #Use[$UseNr]=$percent
    #((UseNr++))
    echo $percent
done

# Send some warnings etc.
DiskDev=0

for i in ${Use[@]};do
    if [ $i -gt $warningRate ];then
        echo "Disk ${Disk[$DiskDev]} is ${Use[$DiskDev]} full"
        ((DiskDev++))
    fi
done

exit 0
