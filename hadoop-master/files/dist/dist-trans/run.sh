#!/bin/bash

JARS=libs/plugins/javax.annotation_1.2.0.v201401042248.jar:libs/plugins/javax.inject_1.0.0.v20091030.jar:libs/plugins/org.eclipse.core.contenttype_3.4.200.v20140207-1251
.jar:libs/plugins/org.eclipse.core.jobs_3.6.1.v20141014-1248.jar:libs/plugins/org.eclipse.core.resources_3.9.1.v20140825-1431.jar:libs/plugins/org.eclipse.core.runtime_3
.10.0.v20140318-2214.jar:libs/plugins/org.eclipse.emf.common_2.11.0.v20150805-0538.jar:libs/plugins/org.eclipse.emf.ecore.xmi_2.11.1.v20150805-0538.jar:libs/plugins/org.
eclipse.emf.ecore_2.11.1.v20150805-0538.jar:libs/plugins/org.eclipse.emf.validation_1.8.0.201405281429.jar:libs/plugins/org.eclipse.equinox.app_1.3.200.v20130910-1609.ja
r:libs/plugins/org.eclipse.equinox.common_3.6.200.v20130402-1505.jar:libs/plugins/org.eclipse.equinox.preferences_3.5.200.v20140224-1527.jar:libs/plugins/org.eclipse.equ
inox.registry_3.5.400.v20140428-1507.jar:libs/plugins/org.eclipse.osgi.compatibility.state_1.0.1.v20140709-1414.jar:libs/plugins/org.eclipse.osgi_3.10.2.v20150203-1939.j
ar:libs/plugins/org.objectweb.asm_5.0.1.v201404251740.jar:libs/plugins/runtime_registry_compatibility.jar:libs/atlmr/plugins/fr.inria.atlanmod.neoemf.hbase_0.1.0.atlmr.j
ar:libs/atlmr/plugins/org.eclipse.m2m.atl.emftvm.trace_3.5.0.atlmr.jar:libs/atlmr/plugins/org.eclipse.m2m.atl.emftvm_3.5.0.atlmr.jar:libs/ivy/default/hbase-client-jar-0.
98.13-hadoop2.jar:libs/ivy/default/hbase-client-javadoc-0.98.13-hadoop2.jar:libs/ivy/default/hbase-client-source-0.98.13-hadoop2.jar:libs/ivy/default/hbase-common-jar-0.
98.13-hadoop2.jar:libs/ivy/default/hbase-common-javadoc-0.98.13-hadoop2.jar:libs/ivy/default/hbase-common-source-0.98.13-hadoop2.jar:libs/ivy/default/hbase-hadoop-compat
-jar-0.98.13-hadoop2.jar:libs/ivy/default/hbase-hadoop-compat-javadoc-0.98.13-hadoop2.jar:libs/ivy/default/hbase-hadoop-compat-source-0.98.13-hadoop2.jar:libs/ivy/defaul
t/hbase-prefix-tree-jar-0.98.13-hadoop2.jar:libs/ivy/default/hbase-protocol-jar-0.98.13-hadoop2.jar:libs/ivy/default/hbase-server-jar-0.98.13-hadoop2.jar:libs/ivy/defaul
t/hbase-server-javadoc-0.98.13-hadoop2.jar:libs/ivy/default/hbase-server-source-0.98.13-hadoop2.jar:libs/ivy/default/zookeeper-jar-3.4.6.jar

LIBJARS=libs/plugins/javax.annotation_1.2.0.v201401042248.jar,libs/plugins/javax.inject_1.0.0.v20091030.jar,libs/plugins/org.eclipse.core.contenttype_3.4.200.v20140207-1
251.jar,libs/plugins/org.eclipse.core.jobs_3.6.1.v20141014-1248.jar,libs/plugins/org.eclipse.core.resources_3.9.1.v20140825-1431.jar,libs/plugins/org.eclipse.core.runtim
e_3.10.0.v20140318-2214.jar,libs/plugins/org.eclipse.emf.common_2.11.0.v20150805-0538.jar,libs/plugins/org.eclipse.emf.ecore.xmi_2.11.1.v20150805-0538.jar,libs/plugins/o
rg.eclipse.emf.ecore_2.11.1.v20150805-0538.jar,libs/plugins/org.eclipse.emf.validation_1.8.0.201405281429.jar,libs/plugins/org.eclipse.equinox.app_1.3.200.v20130910-1609
.jar,libs/plugins/org.eclipse.equinox.common_3.6.200.v20130402-1505.jar,libs/plugins/org.eclipse.equinox.preferences_3.5.200.v20140224-1527.jar,libs/plugins/org.eclipse.
equinox.registry_3.5.400.v20140428-1507.jar,libs/plugins/org.eclipse.osgi.compatibility.state_1.0.1.v20140709-1414.jar,libs/plugins/org.eclipse.osgi_3.10.2.v20150203-193
9.jar,libs/plugins/org.objectweb.asm_5.0.1.v201404251740.jar,libs/plugins/runtime_registry_compatibility.jar,libs/atlmr/plugins/fr.inria.atlanmod.dag.sort_0.1.0.atlmr.ja
r,libs/atlmr/plugins/fr.inria.atlanmod.dag_0.1.0.atlmr.jar,libs/atlmr/plugins/fr.inria.atlanmod.neoemf.hbase_0.1.0.atlmr.jar,libs/atlmr/plugins/org.eclipse.m2m.atl.emftv
m.trace_3.5.0.atlmr.jar,libs/atlmr/plugins/org.eclipse.m2m.atl.emftvm_3.5.0.atlmr.jar,libs/ivy/default/hbase-client-jar-0.98.13-hadoop2.jar,libs/ivy/default/hbase-client
-javadoc-0.98.13-hadoop2.jar,libs/ivy/default/hbase-client-source-0.98.13-hadoop2.jar,libs/ivy/default/hbase-common-jar-0.98.13-hadoop2.jar,libs/ivy/default/hbase-common
-javadoc-0.98.13-hadoop2.jar,libs/ivy/default/hbase-common-source-0.98.13-hadoop2.jar,libs/ivy/default/hbase-hadoop-compat-jar-0.98.13-hadoop2.jar,libs/ivy/default/hbase
-hadoop-compat-javadoc-0.98.13-hadoop2.jar,libs/ivy/default/hbase-hadoop-compat-source-0.98.13-hadoop2.jar,libs/ivy/default/hbase-prefix-tree-jar-0.98.13-hadoop2.jar,lib
s/ivy/default/hbase-protocol-jar-0.98.13-hadoop2.jar,libs/ivy/default/hbase-server-jar-0.98.13-hadoop2.jar,libs/ivy/default/hbase-server-javadoc-0.98.13-hadoop2.jar,libs
/ivy/default/hbase-server-source-0.98.13-hadoop2.jar,libs/ivy/default/zookeeper-jar-3.4.6.jar

array=("$@")
#export HADOOP_CLASSPATH=$HBASE_HOME/lib/*.jar

#eexport HADOOP_CLASSPATH=`hbase classpath`:$JARS

export HADOOP_CLASSPATH=$JARS

echo "classpath is"$HADOOP_CLASSPATH


pos=0 

while [[ $# > 1 ]]
do  
key="$1" 

shift
    
case $key in
    -f | --file)
    TRANSFORMATION="$1"

    shift
    ;;
    -a | --additional-jars)
    LIBJARS=$LIBJARS,${1/:/,}
         
        unset "array[($pos+1)]"
        ((pos++))
        unset "array[($pos+1)]"
        shift
        ;;              
    *)
    ;;
esac
((pos++))

done

$YARNARGS
for i in "${array[@]}"; do
  YARNARGS="$YARNARGS $i"
done

echo "new arguments are: "$YARNARGS

yarn jar  atl-mr.jar  -libjars "$LIBJARS"  -files "$TRANSFORMATION#$TRANSFORMATION"  fr.inria.atlanmod.atl_mr.hbase.ATLMRHBaseMaster $YARNARGS 

