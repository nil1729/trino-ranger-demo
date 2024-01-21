#!/bin/bash

# statup script for ranger-admin
cp /usr/local/share/es/certs/ca/ca.crt /usr/local/share/ca-certificates 
update-ca-certificates 
cd /root/ranger && ./setup.sh 
ranger-admin start 

echo "waiting for catalina.out to be created"
until [ -f /root/ranger/ews/logs/catalina.out ]; do 
  sleep 1
done
tail -f /root/ranger/ews/logs/ranger-admin-*-.log /root/ranger/ews/logs/catalina.out
