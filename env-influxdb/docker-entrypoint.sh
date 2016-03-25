#!/bin/bash

# create predefined database with metrics name
export DB_NAME=${DB_NAME:-metrics}

sleep 12 && curl -s -G http://localhost:8086/query --data-urlencode "q=CREATE USER "$INFLUXDB_USER" WITH PASSWORD '$INFLUXDB_PASSWORD' WITH ALL PRIVILEGES" && curl -s -G http://localhost:8086/query --data-urlencode "u=$INFLUXDB_USER" --data-urlencode "p=$INFLUXDB_PASSWORD" --data-urlencode "q=CREATE DATABASE $DB_NAME" && curl -s -G http://localhost:8086/query --data-urlencode "u=$INFLUXDB_USER" --data-urlencode "p=$INFLUXDB_PASSWORD" --data-urlencode "q=CREATE USER "$INFLUXDB_SUPPORT" WITH PASSWORD '$INFLUXDB_SUPPORT_PASS'" && curl -s -G http://localhost:8086/query --data-urlencode "u=$INFLUXDB_USER" --data-urlencode "p=$INFLUXDB_PASSWORD" --data-urlencode "q=GRANT READ ON $DB_NAME TO $INFLUXDB_SUPPORT" &

exec "$@"
