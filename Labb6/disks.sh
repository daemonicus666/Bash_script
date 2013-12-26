#!/bin/bash
for dev in `df -H | awk '{ print $9 }' | egrep '[\/]'`;do
    Disk[$Nr]=$dev
    echo $dev
done
