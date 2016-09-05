#!/bin/bash

# generation related arguments 
metamodel=./data/modelio/modelio.ecore
output=./output
outputFiles=./output/modelio/*.xmi
seed=123456

#classpath related arguments
GENJARS=libs/instantiator/*:libs/plugins/*:libs/ivy/default/*
# number of models 
declare -a numModels=( 1 3 7 14 27 58 134 277 595 )
#declare -a numModels=( '1' '3' '7' )
#declare -a numModels=( '1' )
# average size of models  
declare -a sizeModels=(2200 6000 10000 20000 40000 80000 200000 500000 1000000)
#declare -a sizeModels=( '2200' '6000' '10000' )
#declare -a sizeModels=( '2200' )

echo 'size of declared array is :'${!numModels[*]} 

for index in ${!numModels[*]}  
do 
echo 'generating ' ${numModels[$index]} ' model(s) with average size equals to: ' ${sizeModels[$index]}

# Launching the generation
java -cp modelioGen.jar:$GENJARS com.mondo.modelio.atl.instantiator.Launcher -m $metamodel -o $output -n ${numModels[$index]} -s ${sizeModels[$index]} -v 0.1 -e $seed

echo 'generation of models with average size' ${sizeModels[$index]} 'finished'

#iterating the output folder to run the transformation
for f in $outputFiles
do
  echo "transforming file $f "
  fout="${f:0:${#f}-3}out.xmi"
  echo $fout		
echo "start running the transformation of $f"
  ./run-trans.sh -f data/modelio/test.emftvm -s data/modelio/modelio.ecore -t data/modelio/modelio.ecore -i $f                       
 echo "tranformation of model $f finished"

#delete file after transformation
  rm $f
done

done


