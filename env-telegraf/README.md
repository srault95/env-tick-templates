# Docker-telegraf

Build a container (https://influxdata.com/time-series-platform/telegraf/).

### Building

```
docker build -t telegraf .
```

### Running

```
docker run -d --name telegraf -v /var/run:/var/run --privileged -e "INFLUX_URL=172.17.0.2:8086" telegraf
```
