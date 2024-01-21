#!/bin/bash

cd /usr/lib/trino/plugin/ranger-2.4.1-trino-plugin && \
./enable-trino-plugin.sh && \
/usr/lib/trino/bin/run-trino
