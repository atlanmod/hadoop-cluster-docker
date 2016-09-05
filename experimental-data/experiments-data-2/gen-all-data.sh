#!/bin/bash

declare -a sizeModels=('5000' '10000' '20000' '50000' '100000')

for model in ${!sizeModels[*]}
do
  Files=./${sizeModels[$model]}/*
  timings=""
  timing=""
  for f in $Files
  do 
    timing=`./gen-data.sh -m ${sizeModels[$model]} -f $f`
    timings=$timings$timing" "
  done
  
  echo -e $timings | awk -v OFS="\t" '$1=$1' &>  timings-dag-${sizeModels[$model]}.txt

  cut -f 1,2,4,6,8,10,12,14,16,18  timings-dag-${sizeModels[$model]}.txt &> timings-dag-${sizeModels[$model]}-cut.txt
  cat timings-dag-${sizeModels[$model]}-cut.txt | awk '{ sum=0; n=0; for(i=2;i<=NF;i++) { sum+=$i; ++n } print $1,"\t", int(sum/n) }' &> timings-dag-${sizeModels[$model]}-average.txt
done


