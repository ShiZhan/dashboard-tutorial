#!/bin/bash
if [ -z "$GRAPHITE_ADDR" ]; then
  ADDR="localhost:2003"
else
  ADDR=$GRAPHITE_ADDR
fi
/usr/bin/collectl -i1 -scdmnstxyCDMNTXY --dskfilt sd -f /var/log/collectl --rawtoo --export graphite,$ADDR,d=1,s=cdmnstxyCDMNTXY
