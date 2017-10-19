# collectl docker

# Usage

```Bash
docker run --name collectl -h "$HOST""-docker" -d -v $PWD/collectl:/var/log/collectl daocloud.io/zhan2016/collectl-docker:master-91c52c0
```

Set hostname (option: "-h") before firing up, for reporting with a readable name.
