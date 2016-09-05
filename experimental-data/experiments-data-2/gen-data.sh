#!/bin/bash

SCRIPT_NAME=$0

function print_usage_and_exit {
  echo "Usage: $SCRIPT_NAME -m <average size> -f <file>"
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
    -f)
    FILE="$1"
    shift
    ;;
    *)
    print_usage_and_exit
    ;;
esac
done

cat $FILE  | grep --color=never -E "splits|ended" | awk ' NR%2 { split($RS,a,":"); sp = a[5]; printf "%d\t", sp}; NR%2==0 { gsub(",","",$6); print substr($6,0,length($6)) } ' 
