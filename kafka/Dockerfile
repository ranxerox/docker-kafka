# Kafka and Zookeeper

FROM openjdk:8

ENV DEBIAN_FRONTEND noninteractive
ENV SCALA_VERSION 2.12
ENV KAFKA_VERSION 2.3.0

# Install Kafka, Zookeeper and other needed things
RUN apt-get update && \
    apt-get install -y supervisor wget && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    wget -q http://apache.mirrors.spacedump.net/kafka/"$KAFKA_VERSION"/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -O /tmp/kafka.tgz && \
    tar xfz /tmp/kafka.tgz -C /opt && \
    mv /opt/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION" /opt/kafka  && \
    rm /tmp/kafka.tgz

# Supervisor config
ADD kafka.conf /etc/supervisor/conf.d/

# 2181 is zookeeper, 9092 is kafka
EXPOSE 2181 9092

CMD ["supervisord", "-n"]
