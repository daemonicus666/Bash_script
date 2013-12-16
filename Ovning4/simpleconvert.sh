#!/bin/bash
usdollar=6.3
sekronor=0.153
convert_Sek(){
    printf "\nHow many SEK? "
    read sek
    sum=`echo "scale=2;$sek*$usdollar" | bc`
    printf "In US Dollars: $sum \n"

}

convert_Usd(){
    printf "\nHow many USD? "
    read usd
    sum=`echo "scale=3;$usd/$sekronor" | bc`
    printf "In SE kronor: $sum \n"
}
printf "Do you want to convert from SEK or USD? [S|U]"
read -n1 -s number
case "$number" in
    s|S) convert_Sek
        ;;
    u|U) convert_Usd
        ;;
esac
exit 0
