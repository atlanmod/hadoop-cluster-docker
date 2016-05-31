#!/bin/bash

declare -a sizeModels=( '10000' '20000' )

for model in ${!sizeModels[*]}
do
  echo "${sizeModels[$model]}"
  for pass in `seq 1 3`
  do
    ./gen-data-raw.sh -m ${sizeModels[$model]} -p $pass &> timings-dag-${sizeModels[$model]}-pass-$pass-raw.txt
  done
done

#echo "merging intermediate timings"
#./merge-data.sh
#echo "generating average"
#./average.sh
#echo "generating speedup"
#./speedup.sh
