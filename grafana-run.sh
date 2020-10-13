#!/bin/bash
(nohup apps/grafana-7.2.1/bin/grafana-server -config conf/defaults.ini > grafana.log)&
(nohup apps/prometheus-2.21.0.linux-amd64/prometheus --config.file conf/prometheus.yml > prometheus.log)&
