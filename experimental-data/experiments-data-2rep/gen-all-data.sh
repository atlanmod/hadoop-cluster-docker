#!/bin/bash

declare -a sizeModels=( '10000' '20000' )

for model in ${!sizeModels[*]}
do
  for pass in `seq 1 3`
  do
    ./gen-data.sh -m ${sizeModels[$model]} -p $pass &> timings-dag-${sizeModels[$model]}-pass-$pass.txt
  done
done

echo "merging intermediate timings"
./merge-data.sh
echo "generating average"
./average.sh
echo "generating minimum"
./minimum.sh
echo "generating speedup"
./speedup.sh
echo "generating max-speedup"
./max-speedup.sh
