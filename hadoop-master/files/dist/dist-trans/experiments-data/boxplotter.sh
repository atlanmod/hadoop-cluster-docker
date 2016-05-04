#!/bin/bash

for i in `seq 0 5`
do
  cut.exe -f2,3,4,5,6,7,8,9,10,11,12,13,14,15 timings-dag-$i-cut.txt > timings-dag-$i-cut-no-nodes.txt
done

paste timings-dag-?-cut-no-nodes.txt &> timings-all-merged-boxplot.txt

split -l 1 -a 1 timings-all-merged-boxplot.txt timings-all-merged-boxplot.txt.

