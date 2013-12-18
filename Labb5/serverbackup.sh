#!/bin/bash

# Any directory you want, here it's just a dummy folder
dirToFolder=home
if [ -d $dirToFolder ];then
    echo `tar -cf serverbackup.tar.gz $dirToFolder`
    printf "Backup complete!\n"
else
    printf "Folder does not exist!\n"
fi
exit 0
