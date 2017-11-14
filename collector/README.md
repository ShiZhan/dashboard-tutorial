# collectl docker

# Usage

Case 1: Connect to local monitor (influxdb with graphite support).

```bash
docker run -d --name collectl \
           -h `hostname`"-docker" \
           -v $PWD/collectl:/var/log/collectl \
           daocloud.io/zhan2016/collectl-docker
```

Case 2: Connect to a designated monitor.

```bash
docker run -d --name collectl \
           -h `hostname`"-docker" \
           -v $PWD/collectl:/var/log/collectl \
           -e GRAPHITE_ADDR=10.0.0.11:2003 \
           daocloud.io/zhan2016/collectl-docker
```

Case 3: Start with fully customized options.

```bash
docker run -d --name collectl \
           -h `hostname`"-docker" \
           -v $PWD/collectl:/var/log/collectl \
           daocloud.io/zhan2016/collectl-docker \
           collectl -i1 -scdmnstxyCDMNTXY --dskfilt sd -f /var/log/collectl --rawtoo --export graphite,10.0.0.11:2003,d=1,s=cdmnstxyCDMNTXY
```

# Common notes before firing up

1. Set hostname (option: "-h") for reporting with a readable name.
2. Set volume (option: "-v") for storing log files.

