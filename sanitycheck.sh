#!/bin/bash
Binaries=( sed awk grep ls)
for i in ${Binaries[@]};do
    which $i > sanity
    for j in `cat sanity`;do
        if [ -x $j ];then
            echo "Executable!"
        else
            echo "Not Executable!"
        fi
    done
done
exit 0
