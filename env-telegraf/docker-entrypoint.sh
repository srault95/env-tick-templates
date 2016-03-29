#!/bin/bash

# Influx URL do not need for Docker compose --> using Docker service variables instead
#export INFLUX_URL=${INFLUX_URL:-172.17.0.2:8086}

# Credentials and DB
export INFLUX_DB=${INFLUX_DB:-metrics}
export INFLUX_USER=${INFLUX_USER:-admin}
export INFLUX_PASSWORD=${INFLUX_PASSWORD:-admin}

sed -i -e "s/_INFLUX_/$INFLUXDB_PORT_8086_TCP_ADDR:$INFLUXDB_PORT_8086_TCP_PORT/g" -e "s/_INFLUXDB_/$INFLUX_DB/g" -e "s/_INFLUXUSER_/$INFLUX_USER/g" -e "s/_INFLUXPASS_/$INFLUX_PASSWORD/g" "${TELEGRAF_CONFIG}"

exec "$@"
