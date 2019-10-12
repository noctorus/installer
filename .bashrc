export SPARK_HOME=/opt/spark
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/jre
export HADOOP_HOME=/opt/hadoop

export PATH=$SPARK_HOME/bin:$PATH
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$HADOOP_HOME/bin:$PATH

export PYSPARK_SUBMIT_ARGS="--packages com.amazonaws:aws-java-sdk:1.7.4,org.apache.hadoop:hadoop-aws:2.7.3 pyspark-shell"