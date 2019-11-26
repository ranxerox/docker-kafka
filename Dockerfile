# Kafka and Zookeeper

FROM openjdk:8-alpine

ENV DEBIAN_FRONTEND noninteractive
ENV SCALA_VERSION 2.12
ENV KAFKA_VERSION 2.3.0

# Install Kafka, Zookeeper and other needed things
RUN apk update && \
    apk add --no-cache bash supervisor && \
    wget -q http://apache.mirrors.spacedump.net/kafka/"$KAFKA_VERSION"/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -O /tmp/kafka.tgz && \
    tar xfz /tmp/kafka.tgz -C /opt && \
    mv /opt/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION" /opt/kafka  && \
    rm /tmp/kafka.tgz

RUN echo -e "\nlisteners = PLAINTEXT://:9092" >> /opt/kafka/config/server.properties
RUN echo -e "\nadvertised.listeners=PLAINTEXT://127.0.0.1:9092" >> /opt/kafka/config/server.properties

# Supervisor config
ADD kafka.conf /etc/supervisord.conf

# 2181 is zookeeper, 9092 is kafka
EXPOSE 2181 9092

CMD ["supervisord", "-n"]
