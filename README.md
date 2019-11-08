# installer

export SPARK_HOME=/usr/local/spark/
export HIVE_HOME=/usr/local/hive/
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/jre
export HADOOP_HOME=/usr/local/hadoop/
export HIVE_CONF_DIR=/usr/local/hive/conf

export PATH=$SPARK_HOME/bin:$PATH
export PATH=$HIVE_HOME/bin:$PATH
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$HADOOP_HOME/bin:$PATH

export CLASSPATH=$CLASSPATH:/usr/local/hadoop/lib/*:.
export CLASSPATH=$CLASSPATH:/usr/local/hive/lib/*:.

export PATH=$PATH:$DERBY_HOME/bin
export METASTORE_PORT=9083

export PYSPARK_SUBMIT_ARGS="--packages com.amazonaws:aws-java-sdk:1.7.4,org.apache.hadoop:hadoop-aws:2.7.3 pyspark-shell"
