#!/bin/bash

SCRIPT_NAME=$0

function print_usage_and_exit {
  echo "Usage: $SCRIPT_NAME -m <average size> -p <pass>"
  exit 1
}

while [[ $# > 1 ]]
do
key="$1"
shift
case $key in
    -m)
    AVR_SIZE="$1"
    shift
    ;;
    -p)
    PASS="$1"
    shift
    ;;
    *)
    print_usage_and_exit
    ;;
esac
done

if [ -z $AVR_SIZE ] || [ -z $PASS ];
then
    print_usage_and_exit
fi


#echo -e "# mappers\tseconds"
cat  $AVR_SIZE/dag-$AVR_SIZE-mappers?-pass-$PASS.txt | grep --color=never -E "splits|time spent by all map tasks|time spent by all reduce tasks|CPU time spent|ended"  | awk 'NR%5==0 { gsub(",","",$6); print substr($6,0,length($6))}; NR%5==1 { printf "%d\t", substr($NF,length($NF),1)}; NR%5==2 { split($RS,a,"="); printf "%d\t",int((a[2]/1000))}; NR%5==3 { split($RS,a,"="); printf "%d\t",int((a[2]/1000))}; NR%5==4 { split($RS,a,"="); printf "%d\t",int((a[2]/1000))};'



