FROM phusion/baseimage:0.9.22
MAINTAINER Zhan.Shi <g.shizhan.g@gmail.com>

RUN apt-get update && apt-get -yq install collectl
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# collectl config
ADD collectl.conf /etc/collectl.conf

# collectl data
VOLUME ["/var/log/collectl"]

ADD run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh && /sbin/init"]
