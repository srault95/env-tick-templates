FROM alpine:edge
MAINTAINER Sergii Porokh <sporokh@softserveinc.com>

ENV TELEGRAF_HOME /telegraf
ENV GOPATH /golang
ENV TELEGRAF_CONFIG /config/telegraf.conf

WORKDIR /golang

RUN apk add --update bash wget git mercurial go make && \
    go get github.com/influxdata/telegraf && \
    go get github.com/sparrc/gdm && \
    cd $GOPATH/src/github.com/influxdata/telegraf && \
    $GOPATH/bin/gdm restore && \
    make build-for-docker && \
    mkdir -p $TELEGRAF_HOME && \
    mv telegraf $TELEGRAF_HOME/ && \
    apk del --purge wget git mercurial go make  && \
    rm -rf /var/cache/apk/* /tmp/* /var/tmp/* $GOPATH

ADD /config/telegraf.conf /config/
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 0755 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/telegraf/telegraf", "-config", "/config/telegraf.conf"]
