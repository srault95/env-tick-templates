# env-tick-templates
Telegraf, InfluxDB, Chronograf, Kapacitor and Grafana

## Docker-compose
Tick stack could be easily run by docker-compose. Check the docker-compose.yml file.

### Usage
To run TICK stack in background do:
```
docker-compose up -d
```
To shutdown TICK stack and remove all its components, network, volumes do:
```
docker-compose down
```
To stop the TICK stack for a while do:
```
docker-compose stop
```
To run TICK stack in FOREGROUNG with all the logs included do:
```
docker-compose up
```

### Services Included

* InfluxDB
```
With authorization:
admin:admin Full access
guest:readonly RO to metrics DB
```
* Telegraf
```
Automaticly connects to InfluxDB and sending system and docker metrics
```
* Grafana
```
Automaticly connects to InfluxDB (datasource included). No dashboards and visualisations.
```
* Chronograf
```
Starts as a service on 10000 port. No datasource included. No visualizations included. No dashboards included.
```
