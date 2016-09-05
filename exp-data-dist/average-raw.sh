#!/bin/bash

declare -a sizeModels=( '10000' '20000' )

for model in ${!sizeModels[*]}
do
  i=${sizeModels[$model]}
  cat timings-class-$i-cut-random.txt | awk '{ sum=0; n=0; for(i=2;i<=NF;i=4+i) { sum+=$i; ++n } print $1,"\t", int(sum/n) }' &> timings-dag-$i-average-random.txt
done
