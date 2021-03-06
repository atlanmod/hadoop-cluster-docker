#!/bin/bash

YARNARGS=$@

JARS=libs/plugins/javax.annotation_1.2.0.v201401042248.jar:libs/plugins/javax.inject_1.0.0.v20091030.jar:libs/plugins/org.eclipse.core.contenttype_3.4.200.v20140207-1251.jar:libs/plugins/org.eclipse.core.jobs_3.6.1.v20141014-1248.jar:libs/plugins/org.eclipse.core.resources_3.9.1.v20140825-1431.jar:libs/plugins/org.eclipse.core.runtime_3.10.0.v20140318-2214.jar:libs/plugins/org.eclipse.emf.common_2.11.1.v20160208-0816.jar:libs/plugins/org.eclipse.emf.ecore.xmi_2.11.1.v20160208-0816.jar:libs/plugins/org.eclipse.emf.ecore_2.11.2.v20160208-0816.jar:libs/plugins/org.eclipse.emf.validation_1.8.0.201405281429.jar:libs/plugins/org.eclipse.equinox.app_1.3.200.v20130910-1609.jar:libs/plugins/org.eclipse.equinox.common_3.6.200.v20130402-1505.jar:libs/plugins/org.eclipse.equinox.preferences_3.5.200.v20140224-1527.jar:libs/plugins/org.eclipse.equinox.registry_3.5.400.v20140428-1507.jar:libs/plugins/org.eclipse.equinox.weaving.hook_1.1.100.weaving-hook-20140821.jar:libs/plugins/org.eclipse.fx.osgi_2.1.0.201508240501.jar:libs/plugins/org.eclipse.m2m.atl.common_3.6.0.v201505221133.jar:libs/plugins/org.eclipse.osgi.compatibility.state_1.0.1.v20140709-1414.jar:libs/plugins/org.eclipse.osgi_3.10.2.v20150203-1939.jar:libs/plugins/org.objectweb.asm_5.0.1.v201404251740.jar:libs/plugins/runtime_registry_compatibility.jar:libs/atlmr-xmi/plugins/org.eclipse.m2m.atl.emftvm.trace_3.5.0.atlmr.jar:libs/atlmr-xmi/plugins/org.eclipse.m2m.atl.emftvm_3.5.0.atlmr.jar:libs/ivy/default/activation-jar-1.1.jar:libs/ivy/default/ant-jar-1.6.2.jar:libs/ivy/default/ant-jar-1.8.1.jar:libs/ivy/default/ant-launcher-jar-1.8.1.jar:libs/ivy/default/aopalliance-jar-1.0.jar:libs/ivy/default/apacheds-i18n-bundle-2.0.0-M15.jar:libs/ivy/default/apacheds-kerberos-codec-bundle-2.0.0-M15.jar:libs/ivy/default/api-asn1-api-bundle-1.0.0-M20.jar:libs/ivy/default/api-util-bundle-1.0.0-M20.jar:libs/ivy/default/asm-jar-3.2.jar:libs/ivy/default/avro-jar-1.7.4.jar:libs/ivy/default/cglib-jar-2.2.1-v20090111.jar:libs/ivy/default/cglib-nodep-jar-3.1.jar:libs/ivy/default/commons-beanutils-core-jar-1.8.0.jar:libs/ivy/default/commons-beanutils-jar-1.7.0.jar:libs/ivy/default/commons-cli-jar-1.2.jar:libs/ivy/default/commons-codec-jar-1.7.jar:libs/ivy/default/commons-collections-jar-3.2.1.jar:libs/ivy/default/commons-collections4-jar-4.0.jar:libs/ivy/default/commons-compress-jar-1.4.1.jar:libs/ivy/default/commons-configuration-jar-1.6.jar:libs/ivy/default/commons-daemon-jar-1.0.13.jar:libs/ivy/default/commons-digester-jar-1.8.jar:libs/ivy/default/commons-el-jar-1.0.jar:libs/ivy/default/commons-httpclient-jar-3.1.jar:libs/ivy/default/commons-io-jar-2.4.jar:libs/ivy/default/commons-lang-jar-2.6.jar:libs/ivy/default/commons-logging-jar-1.1.3.jar:libs/ivy/default/commons-math-jar-2.1.jar:libs/ivy/default/commons-math3-jar-3.1.1.jar:libs/ivy/default/commons-net-jar-3.1.jar:libs/ivy/default/findbugs-annotations-jar-1.3.9-1.jar:libs/ivy/default/guava-bundle-16.0.1.jar:libs/ivy/default/guice-jar-3.0.jar:libs/ivy/default/guice-servlet-jar-3.0.jar:libs/ivy/default/hamcrest-core-jar-1.3.jar:libs/ivy/default/high-scale-lib-jar-1.1.1.jar:libs/ivy/default/htrace-core-jar-2.04.jar:libs/ivy/default/httpclient-jar-4.2.5.jar:libs/ivy/default/httpcore-jar-4.2.5.jar:libs/ivy/default/jackson-core-asl-jar-1.9.13.jar:libs/ivy/default/jackson-jaxrs-jar-1.9.13.jar:libs/ivy/default/jackson-mapper-asl-jar-1.9.13.jar:libs/ivy/default/jackson-xc-jar-1.9.13.jar:libs/ivy/default/jamon-runtime-jar-2.3.1.jar:libs/ivy/default/jasper-compiler-jar-5.5.23.jar:libs/ivy/default/jasper-runtime-jar-5.5.23.jar:libs/ivy/default/java-xmlbuilder-jar-0.4.jar:libs/ivy/default/javax.inject-jar-1.jar:libs/ivy/default/jaxb-api-jar-2.2.2.jar:libs/ivy/default/jaxb-impl-jar-2.2.3-1.jar:libs/ivy/default/jboss-common-jar-4.2.2.GA.jar:libs/ivy/default/jcodings-jar-1.0.8.jar:libs/ivy/default/jdiff-jar-1.0.9.jar:libs/ivy/default/jersey-client-bundle-1.9.jar:libs/ivy/default/jersey-core-bundle-1.9.jar:libs/ivy/default/jersey-guice-jar-1.9.jar:libs/ivy/default/jersey-json-bundle-1.9.jar:libs/ivy/default/jersey-server-bundle-1.9.jar:libs/ivy/default/jets3t-jar-0.9.0.jar:libs/ivy/default/jettison-bundle-1.1.jar:libs/ivy/default/jetty-jar-6.1.26.jar:libs/ivy/default/jetty-sslengine-jar-6.1.26.jar:libs/ivy/default/jetty-util-jar-6.1.26.jar:libs/ivy/default/jline-jar-0.9.94.jar:libs/ivy/default/joni-jar-2.1.2.jar:libs/ivy/default/jsch-jar-0.1.42.jar:libs/ivy/default/jsp-2.1-jar-6.1.14.jar:libs/ivy/default/jsp-api-2.1-jar-6.1.14.jar:libs/ivy/default/jsp-api-jar-2.1.jar:libs/ivy/default/jsr305-jar-1.3.9.jar:libs/ivy/default/junit-jar-4.11.jar:libs/ivy/default/leveldbjni-all-bundle-1.8.jar:libs/ivy/default/log4j-bundle-1.2.17.jar:libs/ivy/default/metrics-core-jar-2.2.0.jar:libs/ivy/default/netty-bundle-3.6.6.Final.jar:libs/ivy/default/paranamer-jar-2.3.jar:libs/ivy/default/protobuf-java-bundle-2.5.0.jar:libs/ivy/default/servlet-api-2.5-jar-6.1.14.jar:libs/ivy/default/servlet-api-jar-2.5.jar:libs/ivy/default/slf4j-api-jar-1.7.5.jar:libs/ivy/default/slf4j-log4j12-jar-1.7.5.jar:libs/ivy/default/snappy-java-bundle-1.0.4.1.jar:libs/ivy/default/stax-api-jar-1.0-2.jar:libs/ivy/default/xmlenc-jar-0.52.jar:libs/ivy/default/xz-jar-1.0.jar
LIBJARS=libs/plugins/javax.annotation_1.2.0.v201401042248.jar,libs/plugins/javax.inject_1.0.0.v20091030.jar,libs/plugins/org.eclipse.core.contenttype_3.4.200.v20140207-1251.jar,libs/plugins/org.eclipse.core.jobs_3.6.1.v20141014-1248.jar,libs/plugins/org.eclipse.core.resources_3.9.1.v20140825-1431.jar,libs/plugins/org.eclipse.core.runtime_3.10.0.v20140318-2214.jar,libs/plugins/org.eclipse.emf.common_2.11.1.v20160208-0816.jar,libs/plugins/org.eclipse.emf.ecore.xmi_2.11.1.v20160208-0816.jar,libs/plugins/org.eclipse.emf.ecore_2.11.2.v20160208-0816.jar,libs/plugins/org.eclipse.emf.validation_1.8.0.201405281429.jar,libs/plugins/org.eclipse.equinox.app_1.3.200.v20130910-1609.jar,libs/plugins/org.eclipse.equinox.common_3.6.200.v20130402-1505.jar,libs/plugins/org.eclipse.equinox.preferences_3.5.200.v20140224-1527.jar,libs/plugins/org.eclipse.equinox.registry_3.5.400.v20140428-1507.jar,libs/plugins/org.eclipse.equinox.weaving.hook_1.1.100.weaving-hook-20140821.jar,libs/plugins/org.eclipse.fx.osgi_2.1.0.201508240501.jar,libs/plugins/org.eclipse.m2m.atl.common_3.6.0.v201505221133.jar,libs/plugins/org.eclipse.osgi.compatibility.state_1.0.1.v20140709-1414.jar,libs/plugins/org.eclipse.osgi_3.10.2.v20150203-1939.jar,libs/plugins/org.objectweb.asm_5.0.1.v201404251740.jar,libs/plugins/runtime_registry_compatibility.jar,libs/atlmr-xmi/plugins/org.eclipse.m2m.atl.emftvm.trace_3.5.0.atlmr.jar,libs/atlmr-xmi/plugins/org.eclipse.m2m.atl.emftvm_3.5.0.atlmr.jar,libs/ivy/default/activation-jar-1.1.jar,libs/ivy/default/ant-jar-1.6.2.jar,libs/ivy/default/ant-jar-1.8.1.jar,libs/ivy/default/ant-launcher-jar-1.8.1.jar,libs/ivy/default/aopalliance-jar-1.0.jar,libs/ivy/default/apacheds-i18n-bundle-2.0.0-M15.jar,libs/ivy/default/apacheds-kerberos-codec-bundle-2.0.0-M15.jar,libs/ivy/default/api-asn1-api-bundle-1.0.0-M20.jar,libs/ivy/default/api-util-bundle-1.0.0-M20.jar,libs/ivy/default/asm-jar-3.2.jar,libs/ivy/default/avro-jar-1.7.4.jar,libs/ivy/default/cglib-jar-2.2.1-v20090111.jar,libs/ivy/default/cglib-nodep-jar-3.1.jar,libs/ivy/default/commons-beanutils-core-jar-1.8.0.jar,libs/ivy/default/commons-beanutils-jar-1.7.0.jar,libs/ivy/default/commons-cli-jar-1.2.jar,libs/ivy/default/commons-codec-jar-1.7.jar,libs/ivy/default/commons-collections-jar-3.2.1.jar,libs/ivy/default/commons-collections4-jar-4.0.jar,libs/ivy/default/commons-compress-jar-1.4.1.jar,libs/ivy/default/commons-configuration-jar-1.6.jar,libs/ivy/default/commons-daemon-jar-1.0.13.jar,libs/ivy/default/commons-digester-jar-1.8.jar,libs/ivy/default/commons-el-jar-1.0.jar,libs/ivy/default/commons-httpclient-jar-3.1.jar,libs/ivy/default/commons-io-jar-2.4.jar,libs/ivy/default/commons-lang-jar-2.6.jar,libs/ivy/default/commons-logging-jar-1.1.3.jar,libs/ivy/default/commons-math-jar-2.1.jar,libs/ivy/default/commons-math3-jar-3.1.1.jar,libs/ivy/default/commons-net-jar-3.1.jar,libs/ivy/default/findbugs-annotations-jar-1.3.9-1.jar,libs/ivy/default/guava-bundle-16.0.1.jar,libs/ivy/default/guice-jar-3.0.jar,libs/ivy/default/guice-servlet-jar-3.0.jar,libs/ivy/default/hamcrest-core-jar-1.3.jar,libs/ivy/default/high-scale-lib-jar-1.1.1.jar,libs/ivy/default/htrace-core-jar-2.04.jar,libs/ivy/default/httpclient-jar-4.2.5.jar,libs/ivy/default/httpcore-jar-4.2.5.jar,libs/ivy/default/jackson-core-asl-jar-1.9.13.jar,libs/ivy/default/jackson-jaxrs-jar-1.9.13.jar,libs/ivy/default/jackson-mapper-asl-jar-1.9.13.jar,libs/ivy/default/jackson-xc-jar-1.9.13.jar,libs/ivy/default/jamon-runtime-jar-2.3.1.jar,libs/ivy/default/jasper-compiler-jar-5.5.23.jar,libs/ivy/default/jasper-runtime-jar-5.5.23.jar,libs/ivy/default/java-xmlbuilder-jar-0.4.jar,libs/ivy/default/javax.inject-jar-1.jar,libs/ivy/default/jaxb-api-jar-2.2.2.jar,libs/ivy/default/jaxb-impl-jar-2.2.3-1.jar,libs/ivy/default/jboss-common-jar-4.2.2.GA.jar,libs/ivy/default/jcodings-jar-1.0.8.jar,libs/ivy/default/jdiff-jar-1.0.9.jar,libs/ivy/default/jersey-client-bundle-1.9.jar,libs/ivy/default/jersey-core-bundle-1.9.jar,libs/ivy/default/jersey-guice-jar-1.9.jar,libs/ivy/default/jersey-json-bundle-1.9.jar,libs/ivy/default/jersey-server-bundle-1.9.jar,libs/ivy/default/jets3t-jar-0.9.0.jar,libs/ivy/default/jettison-bundle-1.1.jar,libs/ivy/default/jetty-jar-6.1.26.jar,libs/ivy/default/jetty-sslengine-jar-6.1.26.jar,libs/ivy/default/jetty-util-jar-6.1.26.jar,libs/ivy/default/jline-jar-0.9.94.jar,libs/ivy/default/joni-jar-2.1.2.jar,libs/ivy/default/jsch-jar-0.1.42.jar,libs/ivy/default/jsp-2.1-jar-6.1.14.jar,libs/ivy/default/jsp-api-2.1-jar-6.1.14.jar,libs/ivy/default/jsp-api-jar-2.1.jar,libs/ivy/default/jsr305-jar-1.3.9.jar,libs/ivy/default/junit-jar-4.11.jar,libs/ivy/default/leveldbjni-all-bundle-1.8.jar,libs/ivy/default/log4j-bundle-1.2.17.jar,libs/ivy/default/metrics-core-jar-2.2.0.jar,libs/ivy/default/netty-bundle-3.6.6.Final.jar,libs/ivy/default/paranamer-jar-2.3.jar,libs/ivy/default/protobuf-java-bundle-2.5.0.jar,libs/ivy/default/servlet-api-2.5-jar-6.1.14.jar,libs/ivy/default/servlet-api-jar-2.5.jar,libs/ivy/default/slf4j-api-jar-1.7.5.jar,libs/ivy/default/slf4j-log4j12-jar-1.7.5.jar,libs/ivy/default/snappy-java-bundle-1.0.4.1.jar,libs/ivy/default/stax-api-jar-1.0-2.jar,libs/ivy/default/xmlenc-jar-0.52.jar,libs/ivy/default/xz-jar-1.0.jar

array=( "$@" )
export HADOOP_CLASSPATH=`hbase classpath`:$JARS

while [[ $# > 1 ]]
do
key="$1"
shift

case $key in
    -f | --file)
    TRANSFORMATION="$1"
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

java -cp atl-mr-xmi.jar:$JARS fr.inria.atlanmod.atl_mr.builder.RecordBuilder -s $SOURCEMM -i $INPUT -o $RECORDS

echo "records file created"

PWD=`pwd`
URIRECORDS=$PWD/$USER/$RECORDS


#echo "new arguments are: "$YARNARGS

#MAPPERS=`yarn node -list | grep -c -E '^\s+\w+:[0-9]+\s+RUNNING\s+'`

yarn jar atl-mr-xmi.jar -libjars "$LIBJARS" -files "$SOURCEMM#$SOURCEMM,$TARGETMM#$TARGETMM,$TRANSFORMATION#$TRANSFORMATION,$INPUT#$INPUT" $YARNARGS -r $URIRECORDS -m 4

#cleaning resources
hdfs dfs -rm -r $URIRECORDS
rm $RECORDS
