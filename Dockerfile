FROM phusion/baseimage:0.9.22
MAINTAINER Zhan.Shi <g.shizhan.g@gmail.com>

RUN curl -sL https://repos.influxdata.com/influxdb.key | apt-key add - && \
    curl -sL https://packagecloud.io/gpg.key           | apt-key add - && \
    echo "deb https://repos.influxdata.com/ubuntu xenial stable"          > /etc/apt/sources.list.d/influxdb.list && \
    echo "deb https://packagecloud.io/grafana/stable/debian/ jessie main" > /etc/apt/sources.list.d/grafana.list  && \
    apt-get update && apt-get -yq install influxdb grafana

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Use /data for all influx disk storage
RUN influxd config > /etc/influxdb.toml
RUN sed -i 's/dir = "\/.*influxdb/dir = "\/influx-data/' /etc/influxdb.toml

# grafana data and config
VOLUME ["/var/lib/grafana", "/var/log/grafana", "/etc/grafana"]
# influxdb data
VOLUME ["/influx-data"]

# grafana http
EXPOSE 3000
# influxdb admin, http, udp, cluster
EXPOSE 8083 8086 8086/udp 8088

ADD run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
