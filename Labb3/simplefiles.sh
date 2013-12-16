#!/bin/bash
if [ -r recept.txt ] && [ -w recept.txt ];then
    vim recept.txt
else
    echo "KABLAAM!"
fi
exit 0
