FROM ubuntu:22.04
RUN apt-get clean && apt-get update
RUN apt-get install -y sudo curl wget bc python3 apt-transport-https gnupg ca-certificates less
RUN curl -s https://repos.azul.com/azul-repo.key | sudo gpg --dearmor -o /usr/share/keyrings/azul.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/azul.gpg] https://repos.azul.com/zulu/deb stable main" | sudo tee /etc/apt/sources.list.d/zulu.list
RUN sudo apt update -y && sudo apt install -y zulu11-jdk
RUN wget -qO /root/trino.jar https://repo1.maven.org/maven2/io/trino/trino-cli/436/trino-cli-436-executable.jar
RUN chmod +x /root/trino.jar
RUN mv /root/trino.jar /usr/bin/trino
WORKDIR /root
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENV JAVA_HOME=/usr/lib/jvm/zulu11-ca-amd64
