#!/bin/bash
(nohup apps/grafana-7.5.7/bin/grafana-server -config conf/defaults.ini > grafana.log)&
(nohup apps/prometheus-2.27.1.linux-amd64/prometheus --config.file conf/prometheus.yml > prometheus.log)&
