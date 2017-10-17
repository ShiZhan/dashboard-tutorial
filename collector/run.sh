#!/bin/bash
/usr/bin/collectl -i1 -scdmnstxyCDMNTXY --dskfilt sd -f /var/log/collectl --rawtoo --export graphite,10.0.0.11:2003,d=1,s=cdmnstxyCDMNTXY
