FROM phusion/baseimage:0.9.22
MAINTAINER Zhan.Shi <g.shizhan.g@gmail.com>

RUN curl -sL https://repos.influxdata.com/influxdb.key | apt-key add - && \
    curl -sL https://packagecloud.io/gpg.key           | apt-key add - && \
    echo "deb https://repos.influxdata.com/ubuntu xenial stable"          > /etc/apt/sources.list.d/influxdb.list && \
    echo "deb https://packagecloud.io/grafana/stable/debian/ jessie main" > /etc/apt/sources.list.d/grafana.list  && \
    apt-get update && apt-get -yq install influxdb grafana

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# simplify behavior in vm or container, turn off reporting and update, remember login.
RUN sed -i \
    -e "s/;reporting_enabled = true/reporting_enabled = false/g" \
    -e "s/;check_for_updates = true/check_for_updates = false/g" \
    -e "s/;login_remember_days = .*/login_remember_days = 365/g" \
    /etc/grafana/grafana.ini

# disable report, enable graphite receiver.
RUN sed -i \
    -e "s/# reporting-disabled = false/reporting-disabled = true/g" \
    -e "s/\[\[graphite\]\]/\[\[graphite\]\]\n  enabled = true/" \
    /etc/influxdb/influxdb.conf

# grafana data and config
VOLUME ["/var/lib/grafana", "/var/log/grafana", "/etc/grafana"]
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
