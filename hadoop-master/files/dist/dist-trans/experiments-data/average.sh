#!/bin/bash

declare -a sizeModels=( '1000' '2000' '5000' '10000' )

for model in ${!sizeModels[*]}
do
  i=${sizeModels[$model]}
  cat timings-dag-$i-cut.txt | awk '{ sum=0; n=0; for(i=2;i<=NF;i++) { sum+=$i; ++n } print $1,"\t", int(sum/n) }' &> timings-dag-$i-average.txt
done
