#!/bin/bash
service grafana-server start
/usr/bin/influxd --config /etc/influxdb.toml
