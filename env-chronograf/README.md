# Docker-chronograf

Build a container (https://influxdata.com/time-series-platform/chronograf/).

### Building

```
docker build -t chronograf .
```

### Running

```
docker run -d --name chronograf -p 10000:10000 chronograf
```

If everything works as expected then you can check the logs
```
[chronograf] 2016/03/25 19:59:19 Starting Chronograf (version 0.11.0)
[chronograf] 2016/03/25 19:59:19 -config flag not provided; will use sensible defaults
[chronograf] 2016/03/25 19:59:19 Bind address not set: falling back to 127.0.0.1:10000
[chronograf] 2016/03/25 19:59:19 Local database path not set: falling back to chronograf.db
[chronograf] 2016/03/25 19:59:19 Query response size limit not set: falling back to limit of 2500000 bytes
[chronograf] 2016/03/25 19:59:19 $CHRONOGRAF_BIND set; overriding value from config file
[chronograf] 2016/03/25 19:59:19 Server binding to http://0.0.0.0:10000
[chronograf] 2016/03/25 19:59:19 Reporting anonymous usage statistics
```
