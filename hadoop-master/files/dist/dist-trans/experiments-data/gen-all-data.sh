#!/bin/bash

declare -a sizeModels=( '1000' '2000' '5000' '10000' )

for model in ${!sizeModels[*]}
do
  for pass in `seq 1 3`
  do
	echo " size-pass ${sizeModels[$model]}-$pass"
    ./gen-data.sh -m ${sizeModels[$model]} -p $pass &> timings-dag-${sizeModels[$model]}-pass-$pass.txt
  done
done

