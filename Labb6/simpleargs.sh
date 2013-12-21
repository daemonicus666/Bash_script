#!/bin/bash
if [ ! $# -ne 2 ];then
    printf "Two arguments were given\n"
else
    printf "I need at least two arguments\n"
fi
exit 0
