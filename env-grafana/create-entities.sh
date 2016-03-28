#!/bin/bash

while ! echo "quit" | nc $HOST 3000 | grep HTTP
  do
    echo "Grafana is not started yet - `date`"
    sleep 3
done

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
