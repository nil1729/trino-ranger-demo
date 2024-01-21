FROM trinodb/trino:433
LABEL maintainer="Nilanjan  Deb"

USER root
RUN microdnf install -y gzip

COPY ranger-2.4.1-trino-plugin.tar.gz /tmp/ranger-2.4.1-trino-plugin.tar.gz
RUN tar -xzf /tmp/ranger-2.4.1-trino-plugin.tar.gz -C /tmp/ && \
    rm -rf /tmp/ranger-2.4.1-trino-plugin.tar.gz && \
    mv /tmp/ranger-2.4.1-SNAPSHOT-trino-plugin /usr/lib/trino/plugin/ranger-2.4.1-trino-plugin && \
    chown -R root:root /usr/lib/trino/plugin/ranger-2.4.1-trino-plugin/*
COPY install.properties /usr/lib/trino/plugin/ranger-2.4.1-trino-plugin/install.properties

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
