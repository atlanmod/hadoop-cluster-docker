#!/bin/bash

declare -a sizeModels=( '1000' '2000' '5000' '10000' )

for model in ${!sizeModels[*]}
do
  i=${sizeModels[$model]}
  reftime=`cat timing-dag-$i-.txt | grep "Execution finished at" | awk ' { print int($4) } '`
  cat timings-dag-$i-cut.txt | awk "{ printf(\"%d\t%.2f\n\", \$1, $reftime/\$2) } " &> timings-dag-$i-speedup.txt
done
