FROM phusion/baseimage:0.9.22
MAINTAINER Zhan.Shi <g.shizhan.g@gmail.com>

RUN apt-get update && apt-get -yq install collectl
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# ssh key pair for colmux
ADD insecure-key /root/.ssh/id_rsa
ADD insecure-key.pub /root/.ssh/id_rsa.pub
RUN chmod 600 /root/.ssh/id_rsa
RUN chmod 644 /root/.ssh/id_rsa.pub

# colmux port
EXPOSE 2655

CMD ["/sbin/init"]
