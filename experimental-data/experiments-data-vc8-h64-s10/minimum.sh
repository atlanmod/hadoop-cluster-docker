#!/bin/bash

declare -a sizeModels=( '10000' '20000' '50000' )

for model in ${!sizeModels[*]}
do
  i=${sizeModels[$model]}
  cat timings-dag-$i-cut.txt | awk '{ min=int($2); for(i=3;i<=NF;i++) {  min = (min < int($i)) ? min : int($i) }; print $1,"\t", int(min) }' &> timings-dag-$i-min.txt
done
