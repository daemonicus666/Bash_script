#!/bin/bash
myVar=`basename $1`
echo `tar -cf "$myVar".backup.tar.gz $myVar`
