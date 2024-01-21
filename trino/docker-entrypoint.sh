#!/bin/bash

cd /ranger-3.0.0-SNAPSHOT-trino-plugin && \
./enable-trino-plugin.sh && \
/usr/lib/trino/bin/run-trino
