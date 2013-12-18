#!/bin/bash
G=30
VG=48
Form=form.txt

print_grade(){
    printf "Your total points was: $Total \n"
    if [ $Total -lt $G ];then
        printf "Your grade is: IG\n"
    elif [ $Total -ge $VG ];then
        printf "Your grade is: VG\n"
    else
        printf "Your grade is G\n"
    fi
    exit 0
}

Points=( `tail -n +3 $Form | awk '{print $1}'` )
Total=0

for i in ${Points[*]};do
    Total=$((Total+i))
done

print_grade

exit 0
