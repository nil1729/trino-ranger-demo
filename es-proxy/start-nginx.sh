#!/bin/bash
envsubst '\$SETUP_IP,\$TRINO_IP,\$RANGER_IP' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
exec nginx -g 'daemon off;'
