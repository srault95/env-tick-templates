#!/bin/bash

#export INFLUX_URL=${INFLUX_URL:-172.17.0.2:8086}
#export INFLUX_DB=${INFLUX_DB:-metrics}
#export INFLUX_USER=${INFLUX_USER:-admin}
#export INFLUX_PASSWORD=${INFLUX_PASSWORD:-admin}

#sed -i -e "s/_INFLUX_/$INFLUX_URL/g" -e "s/_INFLUXDB_/$INFLUX_DB/g" -e "s/_INFLUXUSER_/$INFLUX_USER/g" -e "s/_INFLUXPASS_/$INFLUX_PASSWORD/g" "${TELEGRAF_CONFIG}"

exec "$@"
