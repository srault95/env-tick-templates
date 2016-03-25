# docker-influxdb

Build a container (https://influxdb.com/).


### Building

To build 

```
docker build -t influxdb .
```

### Running

To run the container as a daemon and therefore a single node influxdb cluster

```
docker run -d --name influxdb -p 8083:8083 -p 8086:8086 influxdb
```

If everything works as expected then you can check the logs

```
docker logs influxdb

 8888888           .d888 888                   8888888b.  888888b.
   888            d88P"  888                   888  "Y88b 888  "88b
   888            888    888                   888    888 888  .88P
   888   88888b.  888888 888 888  888 888  888 888    888 8888888K.
   888   888 "88b 888    888 888  888  Y8bd8P' 888    888 888  "Y88b
   888   888  888 888    888 888  888   X88K   888    888 888    888
   888   888  888 888    888 Y88b 888 .d8""8b. 888  .d88P 888   d88P
 8888888 888  888 888    888  "Y88888 888  888 8888888P"  8888888P"

[run] 2016/03/25 15:21:11 InfluxDB starting, version 0.11.0, branch master, commit 97f55e6
[run] 2016/03/25 15:21:11 Go version go1.6, GOMAXPROCS set to 4
[run] 2016/03/25 15:21:11 Using configuration at: /config/config.toml
[store] 2016/03/25 15:21:11 Using data dir: /data/influxdb/data
[subscriber] 2016/03/25 15:21:11 opened service
[monitor] 2016/03/25 15:21:11 Starting monitor system
[monitor] 2016/03/25 15:21:11 'build' registered for diagnostics monitoring
[monitor] 2016/03/25 15:21:11 'runtime' registered for diagnostics monitoring
[monitor] 2016/03/25 15:21:11 'network' registered for diagnostics monitoring
[monitor] 2016/03/25 15:21:11 'system' registered for diagnostics monitoring
[cluster] 2016/03/25 15:21:11 Starting cluster service
[shard-precreation] 2016/03/25 15:21:11 Starting precreation service with check interval of 10m0s, advance period of 30m0s
[snapshot] 2016/03/25 15:21:11 Starting snapshot service
[copier] 2016/03/25 15:21:11 Starting copier service
[admin] 2016/03/25 15:21:11 Starting admin service
[admin] 2016/03/25 15:21:11 Listening on HTTP: [::]:8083
[continuous_querier] 2016/03/25 15:21:11 Starting continuous query service
[httpd] 2016/03/25 15:21:11 Starting HTTP service
[httpd] 2016/03/25 15:21:11 Authentication enabled: true
[httpd] 2016/03/25 15:21:11 Listening on HTTP: [::]:8086
[retention] 2016/03/25 15:21:11 Starting retention policy enforcement service with check interval of 30m0s
[monitor] 2016/03/25 15:21:11 Storing statistics in database '_internal' retention policy 'monitor', at interval 10s
[run] 2016/03/25 15:21:11 Sending anonymous usage statistics to m.influxdb.com
[run] 2016/03/25 15:21:11 Listening for signals
```

### Attaching to the container

You can attach to a running instance of a container and get a shell to influxdb

```
docker exec -it influxdb bash


influxdb@8069b1e48d4e:/$ /opt/influxdb/influx
Connected to http://localhost:8086 version FIXME
InfluxDB shell 0.9.0
> 
```
