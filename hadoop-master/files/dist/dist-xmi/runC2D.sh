#!/bin/bash

file=data/Flow2Data/ControlFlowGraph-with-Vars.xmi
for i in `seq 2 8`
do
echo "start running the transformation for $i mappers"

  ./run-trans.sh -f data/Flow2Data/Flow2Data_noRI.emftvm -s data/Flow2Data/FlowGraph.ecore -t data/Flow2Data/FlowGraph.ecore -i $file -m $i
echo "tranformation for $i mappers finished" 

done

