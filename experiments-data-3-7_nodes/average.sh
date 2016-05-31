#!/bin/bash

declare -a sizeModels=('5000' '10000' '20000' '50000' '100000'  )

for model in ${!sizeModels[*]}
do
  i=${sizeModels[$model]}
  cat timings-dag-$i-cut.txt | awk '{ sum=0; n=0; for(i=2;i<=NF;i++) { sum+=$i; ++n } print $1,"\t", int(sum/n) }' | awk '{ if ( NR == 1 ) { store=$0 } else { print } }END{ print store }'  &> timings-dag-$i-average.txt
done
