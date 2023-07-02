FROM ubuntu:20.04

RUN apt update && apt upgrade -y
RUN apt install openjdk-8-jdk -y
RUN apt install wget -y
RUN wget https://dlcdn.apache.org/kafka/3.5.0/kafka_2.13-3.5.0.tgz
RUN tar -xzf kafka_2.13-3.5.0.tgz && rm -rf kafka_2.13-3.5.0.tgz

RUN ls -l
WORKDIR ./kafka_2.13-3.5.0
RUN sed -i 's/zookeeper.connect=localhost:2181/zookeeper.connect=172.18.0.2:2181/' ./config/server.properties

CMD [ "/bin/bash" ]
