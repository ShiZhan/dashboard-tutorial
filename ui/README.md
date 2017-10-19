# grafana with influxdb

## Usage

```bash
docker run -d --name grafana \
           -p 3000:3000 -p 8086:8086 -p 2003:2003 \
           daocloud.io/zhan2016/grafana-influxdb-docker
```
