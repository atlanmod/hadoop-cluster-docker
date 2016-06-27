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
cat $AVR_SIZE/dag-$AVR_SIZE-mappers?-pass-$PASS.txt  | grep --color=never -E "splits|ended" | awk ' NR%2 { printf substr($NF,length($NF),1)"\t"}; NR%2==0 { gsub(",","",$6); print substr($6,0,length($6)-1) }'
