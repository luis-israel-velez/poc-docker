FROM apache/spark:v3.3.0

USER root
RUN rm $SPARK_HOME/jars/guava-14.0.1.jar
ADD https://repo1.maven.org/maven2/com/google/guava/guava/27.0-jre/guava-27.0-jre.jar $SPARK_HOME/jars
ADD https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.1/hadoop-aws-3.3.1.jar $SPARK_HOME/jars
ADD https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.901/aws-java-sdk-bundle-1.11.901.jar $SPARK_HOME/jars
ADD https://repo1.maven.org/maven2/com/google/cloud/bigdataoss/gcs-connector/hadoop3-2.2.12/gcs-connector-hadoop3-2.2.12-shaded.jar $SPARK_HOME/jars
ADD https://repo1.maven.org/maven2/org/wildfly/openssl/wildfly-openssl/1.0.7.Final/wildfly-openssl-1.0.7.Final.jar $SPARK_HOME/jars
ADD https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime-3.3_2.12/1.2.0/iceberg-spark-runtime-3.3_2.12-1.2.0.jar $SPARK_HOME/jars
ADD https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-hive-runtime/1.2.0/iceberg-hive-runtime-1.2.0.jar $SPARK_HOME/jars


WORKDIR /app
COPY key.json key.json
COPY aws_key.json aws_key.json
ENV GOOGLE_APPLICATION_CREDENTIALS=/app/key.json
#ARG temp1=`cut -d "," -f 1 /app/aws_key.json`
#ARG temp2=`cut -d "," -f 2 /app/aws_key.json`
ENV AWS_ACCESS_KEY_ID="<Your key here>"
ENV AWS_SECRET_KEY="<Your key here>"
ENTRYPOINT [ "/opt/entrypoint.sh" ]
