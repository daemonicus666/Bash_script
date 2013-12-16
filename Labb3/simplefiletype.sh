#!/bin/bash
if [ -d $1 ];then
        echo "This is a directory"
    elif [ -f $1 ];then
        echo "This is a regular file"
    elif [ -b $1 ];then
        echo "This is a block device"
    elif [ -h $1 ];then
        echo "This is a link"
    else
        echo "Massive error"
fi
exit 0
