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

If everything works as expected then you can check the logs
```
2016/03/25 18:07:26 Starting Telegraf (version 0.11.1-52-g474d6db)
2016/03/25 18:07:26 Loaded outputs: influxdb
2016/03/25 18:07:26 Loaded inputs: disk diskio mem swap system docker cpu
2016/03/25 18:07:26 Tags enabled: host=aa764cc83ee6
2016/03/25 18:07:26 Agent Config: Interval:10s, Debug:false, Quiet:true, Hostname:"aa764cc83ee6", Flush Interval:10s 
```
