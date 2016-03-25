FROM ubuntu:14.04
MAINTAINER Sergii Porokh <sporokh@softserveinc.com>

ENV CHRONOGRAF_HOME /chronograf
ENV CHRONOGRAF_URL=${CHRONOGRAF_URL:-https://s3.amazonaws.com/get.influxdb.org/chronograf}
ENV CHRONOGRAF_FILE=${CHRONOGRAF_FILE:-chronograf_0.11.0_amd64.deb}
ENV CHRONOGRAF_CONFIG /config/config.toml

RUN apt-get update && apt-get install -y wget && \
    wget $CHRONOGRAF_URL/$CHRONOGRAF_FILE && \
    dpkg -i $CHRONOGRAF_FILE && rm $CHRONOGRAF_FILE


ADD /config/config.toml /config/
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 0755 /docker-entrypoint.sh

# Allow Chronograf to accept connections from other hosts
ENV CHRONOGRAF_BIND=0.0.0.0:10000
EXPOSE 10000

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD [ "/opt/chronograf/chronograf" ]
