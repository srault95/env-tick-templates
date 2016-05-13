FROM alpine:edge
MAINTAINER Sergii Porokh <sporokh@softserveinc.com>

WORKDIR /golang
ENV GOPATH /golang
ENV INFLUXDB_HOME /influxdb
ENV PATH $INFLUXDB_HOME:$PATH
ENV INFLUXDB_VERSION=${INFLUX_VERSION:-0.13.0}
ENV INFLUXDB_USER=${INFLUXDB_USER:-admin}
ENV INFLUXDB_PASSWORD=${INFLUXDB_PASSWORD:-admin}
ENV INFLUXDB_SUPPORT=${INFLUXDB_SUPPORT:-guest}
ENV INFLUXDB_SUPPORT_PASS=${INFLUXDB_SUPPORT_PASS:-readonly}

ADD /config/config.toml /config/

RUN \
  apk add --update curl bash wget git mercurial bzr go && \
  go get github.com/influxdata/influxdb && \
  go get github.com/sparrc/gdm && \
  cd $GOPATH/src/github.com/influxdata/influxdb && \
  $GOPATH/bin/gdm restore && \
  go clean ./... && \
  sha="$( git --no-pager log --no-walk --format='%h' HEAD )" && \
  now="$(date +%s)" && \
  go install -ldflags="-X main.version=$INFLUXDB_VERSION -X main.branch=master -X main.commit=$sha -X main.buildTime=$now" ./... && \
  mkdir -p $INFLUXDB_HOME && \
  cp $GOPATH/bin/influx* $INFLUXDB_HOME/   && \
  mkdir -p /data /logs /config && \
  apk del --purge wget git mercurial bzr go  && \
  rm -rf /var/cache/apk/* /tmp/* /var/tmp/* $GOPATH

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 0755 /docker-entrypoint.sh
# Expose the admin port
EXPOSE 8083

# Expose the ssl http api port
EXPOSE 8084

# Expose the http api port
EXPOSE 8086

# raft protocol port used by the cluster
#EXPOSE 8090

# protobuf protocol por used for replication
#EXPOSE 8099

# volume used for storing database logs and data
VOLUME ["/data"]

# volume used for storing debug logs
VOLUME ["/logs"]

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/influxdb/influxd", "-config", "/config/config.toml"]
