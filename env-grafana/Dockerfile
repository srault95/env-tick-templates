FROM alpine:edge
MAINTAINER Sergii Porokh <sporokh@softserveinc.com>

# Set environment variables
ENV GOSU_VERSION=${GOSU_VERSION:-1.7}
ENV GRAFANA_VERSION=${GRAFANA_VERSION:-v2.6.0}
ENV GOPATH=${GOPATH:-/go}
ENV GRAFANA_SRC_FOLDER=${GRAFANA_SRC_FOLDER:-$GOPATH/src/github.com/grafana}
ENV GRAFANA_URL=${GRAFANA_URL:-https://github.com/grafana/grafana.git}
ENV GRAFANA_ROOT=${GRAFANA_ROOT:-/usr/share/grafana}
ENV PATH=$PATH:$GOPATH/bin:$GRAFANA_ROOT/bin

# Grafana variables
ENV HOST=${HOST:-localhost}
ENV PORT=${PORT:-3000}
ENV CREDENTIALS=${CREDENTIALS:-admin:admin}

RUN apk add --update ca-certificates build-base bash nodejs go git mercurial curl \
    && curl -ksL -o /bin/gosu https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64 \
    && chmod +x /bin/gosu \
    && mkdir -p $GRAFANA_SRC_FOLDER && cd $GRAFANA_SRC_FOLDER \
    && git clone $GRAFANA_URL -b $GRAFANA_VERSION \
    && cd grafana \
    && go run build.go setup \
    && godep restore \
    && go build . \
    && npm install \
    && npm install -g grunt-cli \
    && cd $GRAFANA_SRC_FOLDER/grafana/node_modules/karma-phantomjs-launcher/node_modules/phantomjs && node install \
    && cd $GRAFANA_SRC_FOLDER/grafana && grunt \
    && npm uninstall -g grunt-cli \
    && npm cache clear \
    && mkdir -p $GRAFANA_ROOT/bin/ \
    && cp -a $GRAFANA_SRC_FOLDER/grafana/grafana $GRAFANA_ROOT/bin/grafana-server \
    && cp -ra $GRAFANA_SRC_FOLDER/grafana/public_gen $GRAFANA_ROOT \
    && mv $GRAFANA_ROOT/public_gen $GRAFANA_ROOT/public \
    && cp -ra ${GRAFANA_SRC_FOLDER}/grafana/conf $GRAFANA_ROOT \
    && adduser -D -H -h $GRAFANA_ROOT -s /bin/bash stoic \
    && mkdir -p /etc/confd/conf.d \
    && sed -i 's/dark/light/g' $GRAFANA_ROOT/public/views/index.html \
    && go clean -i -r \
    && apk del --purge build-base nodejs go git mercurial \
    && rm -rf /go /tmp/* /var/cache/apk/* /root/.n* /usr/local/bin/phantomjs

COPY docker-entrypoint.sh /
COPY conf/defaults.ini /usr/share/grafana/conf/defaults.ini
COPY create-entities.sh /tmp/create-entities.sh

COPY conf/influxdb-datasource.json /tmp/influxdb-datasource.json

COPY conf/containers-dashboard.json /tmp/containers-dashboard.json
COPY conf/production-dashboard.json /tmp/production-dashboard.json

RUN chmod 0755 /docker-entrypoint.sh /tmp/create-entities.sh && chown -Rf stoic $GRAFANA_ROOT*

EXPOSE 3000
WORKDIR $GRAFANA_ROOT
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["grafana-server", "-config", "/usr/share/grafana/conf/defaults.ini"]

