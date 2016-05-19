FROM debian:jessie
MAINTAINER Sergii Porokh <sporokh@softserveinc.com>

ENV GRAFANA_VERSION=${GRAFANA_VERSION:-3.0.1}

RUN apt-get update && \
    apt-get -y --no-install-recommends install libfontconfig curl netcat-openbsd ca-certificates && \
    apt-get clean && \
    curl https://grafanarel.s3.amazonaws.com/builds/grafana_${GRAFANA_VERSION}_amd64.deb > /tmp/grafana.deb && \
    dpkg -i /tmp/grafana.deb && \
    rm /tmp/grafana.deb && \
    curl -L https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64 > /usr/sbin/gosu && \
    chmod +x /usr/sbin/gosu && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/var/lib/grafana", "/var/lib/grafana/plugins", "/var/log/grafana", "/etc/grafana"]

EXPOSE 3000

# Copy initial scripts
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
COPY ./create-entities.sh /tmp/create-entities.sh

# Copy dahsboards and datasources
COPY conf/influxdb-datasource.json /tmp/influxdb-datasource.json
COPY conf/containers-dashboard.json /tmp/containers-dashboard.json
COPY conf/production-dashboard.json /tmp/production-dashboard.json

RUN chmod a+x /docker-entrypoint.sh /tmp/create-entities.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
