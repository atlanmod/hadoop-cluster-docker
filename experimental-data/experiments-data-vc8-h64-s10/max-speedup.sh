#!/bin/bash

declare -a sizeModels=( '10000' '20000' '50000')

for index in ${!sizeModels[*]}
do
  i=${sizeModels[$index]} 
  reftime=`cat timings-dag-$i-min.txt  | awk ' NR==1 { print $2 } '`
  echo "reftime: $reftime"
  cat timings-dag-$i-min.txt | awk -v ref="$reftime" '{sp =ref / $2;  printf "%d\t%.2f\n", $1, sp }' &> timings-dag-$i-max-speedup.txt
done
