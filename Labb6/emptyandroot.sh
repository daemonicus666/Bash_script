#!/bin/bash
tempDir=/tmp/*
if [ $EUID -ne 0 ];then
    printf "Please run as root\n"
else
    rm $tempDir
fi
exit 0
