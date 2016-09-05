#!/bin/bash

declare -a sizeModels=( '1000' )
iter=1
for model in ${!sizeModels[*]}
do
  echo "${sizeModels[$model]}"
  for pass in `seq 1 $iter`
  do
    ./gen-data-raw.sh -m ${sizeModels[$model]} -p $pass -r 1 &> timings-class-${sizeModels[$model]}-pass-$pass-raw-random.txt
    ./gen-data-raw.sh -m ${sizeModels[$model]} -p $pass &> timings-class-${sizeModels[$model]}-pass-$pass-raw-greedy.txt
  done
done


#echo "merging intermediate timings"
for model in ${!sizeModels[*]}
do
  i=${sizeModels[$model]}
  paste timings-class-$i-pass*-raw-gre* &> timings-class-$i-merged-raw.txt
  cut -f1,2,3,4,5,6,8,9,10,11,12,13, timings-class-$i-merged-raw.txt &> timings-class-$i-cut-raw-greedy.txt


  paste timings-class-$i-pass*-raw-ran* &> timings-class-$i-merged-raw.txt
  cut -f1,2,3,4,5,6,8,9,10,11,12,13, timings-class-$i-merged-raw.txt &> timings-class-$i-cut-raw-random.txt

done

#echo "generating average"
#./average.sh
#echo "generating speedup"
#./speedup.sh
