#!/bin/bash

declare -a sizeModels=('5000' '10000' '20000' '50000' '100000')

for model in ${!sizeModels[*]}
do
  i=${sizeModels[$model]}
  paste timings-dag-$i-pass-* &> timings-dag-$i-merged.txt
  cut -f1,2,4,6,8,10,12,14,16,18,20,22,24 timings-dag-$i-merged.txt &> timings-dag-$i-cut.txt
done


