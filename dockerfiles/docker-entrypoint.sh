#!/bin/bash


cp /usr/local/share/es/certs/ca/ca.crt /usr/local/share/ca-certificates && \
update-ca-certificates && \
cd /root/ranger && \
./setup.sh && \
ranger-admin start && \
tail -f /root/ranger/ews/logs/ranger-admin-*-.log
