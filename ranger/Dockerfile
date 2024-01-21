FROM ubuntu:22.04

RUN apt-get clean && apt-get update

ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y sudo curl wget bc python3 apt-transport-https gnupg ca-certificates

RUN wget -qO /root/postgresql.jar https://jdbc.postgresql.org/download/postgresql-42.2.23.jar

RUN curl -s https://repos.azul.com/azul-repo.key | sudo gpg --dearmor -o /usr/share/keyrings/azul.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/azul.gpg] https://repos.azul.com/zulu/deb stable main" | sudo tee /etc/apt/sources.list.d/zulu.list
RUN sudo apt update -y && sudo apt install -y zulu11-jdk

WORKDIR /root

COPY ranger-3.0.0-SNAPSHOT-admin.tar.gz .
RUN tar -xzf ranger-3.0.0-SNAPSHOT-admin.tar.gz && rm ranger-3.0.0-SNAPSHOT-admin.tar.gz && mv ranger-3.0.0-SNAPSHOT-admin ranger
RUN rm -f /root/ranger/ews/lib/lucene-core-*.jar
RUN wget -qO /root/ranger/ews/lib/lucene-core-8.7.0.jar https://repo1.maven.org/maven2/org/apache/lucene/lucene-core/8.7.0/lucene-core-8.7.0.jar
COPY docker-entrypoint.sh .

ENV JAVA_HOME=/usr/lib/jvm/zulu11-ca-amd64

RUN chmod +x docker-entrypoint.sh
