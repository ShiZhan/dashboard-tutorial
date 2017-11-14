FROM phusion/baseimage:0.9.22
MAINTAINER Zhan.Shi <g.shizhan.g@gmail.com>

RUN curl -sL https://repos.influxdata.com/influxdb.key | apt-key add - && \
    curl -sL https://packagecloud.io/gpg.key           | apt-key add - && \
    echo "deb https://repos.influxdata.com/ubuntu xenial stable"          > /etc/apt/sources.list.d/influxdb.list && \
    echo "deb https://packagecloud.io/grafana/stable/debian/ jessie main" > /etc/apt/sources.list.d/grafana.list  && \
    apt-get update && apt-get -yq install influxdb grafana

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# no need to report usage in vm, either grafana or influxdb, just turn them off.
RUN sed -i "s/;reporting_enabled = true/reporting_enabled = false/g" /etc/grafana/grafana.ini
RUN sed -i "s/# reporting-disabled = false/reporting-disabled = true/g" /etc/influxdb/influxdb.conf
# enable graphite collector
RUN sed -i 's/\[\[graphite\]\]/\[\[graphite\]\]\n  enabled = true/' /etc/influxdb/influxdb.conf

# grafana data and config
#VOLUME ["/var/lib/grafana", "/var/log/grafana", "/etc/grafana"]
# influxdb data
VOLUME ["/var/lib/influxdb"]

# grafana http
EXPOSE 3000
# influxdb admin, http, udp, cluster
EXPOSE 8083 8086 8086/udp 8088
# influxdb graphite
EXPOSE 2003

ADD run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
