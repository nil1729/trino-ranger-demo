FROM ubuntu:22.04

RUN apt-get clean && apt-get update

ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y sudo curl wget bc python3 apt-transport-https gnupg ca-certificates

RUN wget -qO /root/postgresql.jar https://jdbc.postgresql.org/download/postgresql-42.2.23.jar

# RUN sudo apt-key adv --keyserver keyserver.ubuntu.com:80 --recv-keys 3B4FE6ACC0B21F32
RUN curl -s https://repos.azul.com/azul-repo.key | sudo gpg --dearmor -o /usr/share/keyrings/azul.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/azul.gpg] https://repos.azul.com/zulu/deb stable main" | sudo tee /etc/apt/sources.list.d/zulu.list

RUN sudo apt update -y && sudo apt install -y zulu11-jdk

WORKDIR /root

# COPY ranger-2.4.1-admin.tar.gz .
# RUN tar -xzf ranger-2.4.1-admin.tar.gz && rm ranger-2.4.1-admin.tar.gz && mv ranger-2.4.1-SNAPSHOT-admin ranger
# COPY install.properties /root/ranger/install.properties
# COPY docker-entrypoint.sh .

COPY ranger-3.0.0-SNAPSHOT-admin.tar.gz .
RUN tar -xzf ranger-3.0.0-SNAPSHOT-admin.tar.gz && rm ranger-3.0.0-SNAPSHOT-admin.tar.gz && mv ranger-3.0.0-SNAPSHOT-admin ranger
COPY install.properties /root/ranger/install.properties
COPY docker-entrypoint.sh .

ENV JAVA_HOME=/usr/lib/jvm/zulu11-ca-amd64

RUN chmod +x docker-entrypoint.sh