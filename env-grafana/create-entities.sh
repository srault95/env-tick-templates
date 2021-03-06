#!/bin/bash

# Grafana variables
export HOST=localhost
export PORT=3000
export CREDENTIALS=admin:admin

while ! echo "quit" | nc $HOST 3000 | grep HTTP
  do
    echo "Grafana is not started yet - `date`"
    sleep 3
done

sed -i -e "s/_INFLUX_/$INFLUXDB_PORT_8086_TCP_ADDR:$INFLUXDB_PORT_8086_TCP_PORT/g" "/tmp/influxdb-datasource.json"

# add datasources to grafana
for item in $(ls /tmp/*-datasource.json); do
  curl -k -u $CREDENTIALS -H 'content-type: application/json' http://$HOST:$PORT/api/datasources -d@$item;
  echo "Datatosource created successfully $item"
  sleep 2
done

# add dashboards
for item in $(ls /tmp/*-dashboard.json); do
  curl -k -u $CREDENTIALS -H 'content-type: application/json' http://$HOST:$PORT/api/dashboards/db -d@$item;
  echo "Dashboard created successfully $item"
  sleep 2
done
