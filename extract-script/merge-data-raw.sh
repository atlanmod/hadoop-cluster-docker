#!/bin/bash

declare -a sizeModels=( '10000' '20000' )
for model in ${!sizeModels[*]}
do
  i=${sizeModels[$model]}
  paste timings-dag-$i-pass*-raw* &> timings-dag-$i-merged-raw.txt
  cut -f1,2,3,4,5,7,8,9,10,12,13,14,15 timings-dag-$i-merged-raw.txt &> timings-dag-$i-cut-raw.txt
  rm timings-dag-$i-merged-raw.txt
done


