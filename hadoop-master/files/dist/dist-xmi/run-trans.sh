#!/bin/bash

export PATH=$PATH:$HADOOP_PREFIX/bin
YARNARGS=$@


JARS=atlmr-libs/atlmr/plugins/*:atlmr-libs/plugins/*:atlmr-libs/ivy/default/*
LIBJARS=atlmr-libs/plugins/org.eclipse.m2m.atl.common_3.6.0.v201505221133.jar,atlmr-libs/plugins/javax.annotation_1.2.0.v201401042248.jar,atlmr-libs/plugins/javax.inject_1.0.0.v20091030.jar,atlmr-libs/plugins/org.eclipse.core.contenttype_3.4.200.v20140207-1251.jar,atlmr-libs/plugins/org.eclipse.core.jobs_3.6.1.v20141014-1248.jar,atlmr-libs/plugins/org.eclipse.core.resources_3.9.1.v20140825-1431.jar,atlmr-libs/plugins/org.eclipse.core.runtime_3.10.0.v20140318-2214.jar,atlmr-libs/plugins/org.eclipse.emf.common_2.11.0.v20150805-0538.jar,atlmr-libs/plugins/org.eclipse.emf.ecore.xmi_2.11.1.v20150805-0538.jar,atlmr-libs/plugins/org.eclipse.emf.ecore_2.11.1.v20150805-0538.jar,atlmr-libs/plugins/org.eclipse.emf.validation_1.8.0.201405281429.jar,atlmr-libs/plugins/org.eclipse.equinox.app_1.3.200.v20130910-1609.jar,atlmr-libs/plugins/org.eclipse.equinox.common_3.6.200.v20130402-1505.jar,atlmr-libs/plugins/org.eclipse.equinox.preferences_3.5.200.v20140224-1527.jar,atlmr-libs/plugins/org.eclipse.equinox.registry_3.5.400.v20140428-1507.jar,atlmr-libs/plugins/org.eclipse.osgi.compatibility.state_1.0.1.v20140709-1414.jar,atlmr-libs/plugins/org.eclipse.osgi_3.10.2.v20150203-1939.jar,atlmr-libs/plugins/org.objectweb.asm_5.0.1.v201404251740.jar,atlmr-libs/plugins/runtime_registry_compatibility.jar,atlmr-libs/atlmr/plugins/org.eclipse.m2m.atl.emftvm.trace_3.5.0.atlmr.jar,atlmr-libs/atlmr/plugins/org.eclipse.m2m.atl.emftvm_3.5.0.atlmr.jar

MAPPERS=4

while [[ $# > 1 ]]
do
key="$1"
shift

case $key in
    -f | --file)
    TRANSFORMATION="$1"
    shift
    ;;
    -m | --mappers)
    MAPPERS="$1"
    shift
    ;;
    -s | --source-metamodel)
    SOURCEMM="$1"
    shift
    ;;
    -t | --target-metamodel)
    TARGETMM="$1"
    shift
    ;;
    -i | --input)
    INPUT="$1"
    shift
    ;;
    *)
    ;;
esac
done
			
RECORDS=$INPUT.rec
echo $RECORDS

java -cp atl-mr.jar:$JARS fr.inria.atlanmod.atl_mr.builder.RecordBuilder -s $SOURCEMM -i $INPUT -o $RECORDS

echo "records file created" 

PWD=`pwd`
URIRECORDS=$PWD/$USER/$RECORDS

hdfs dfs -mkdir -p $PWD/$USER`dirname $RECORDS`
hdfs dfs -copyFromLocal -f $RECORDS $URIRECORDS

#MAPPERS=`yarn node -list | grep -c -E '^\s+\w+:[0-9]+\s+RUNNING\s+'`

yarn jar atl-mr.jar -libjars "$LIBJARS" -files "$SOURCEMM#$SOURCEMM,$TARGETMM#$TARGETMM,$TRANSFORMATION#$TRANSFORMATION,$INPUT#$INPUT" $YARNARGS -r $URIRECORDS -m $MAPPERS

#cleaning resources
hdfs dfs -rm -r $URIRECORDS
rm $RECORDS
