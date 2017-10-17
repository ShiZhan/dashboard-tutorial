#!/bin/bash
/usr/bin/collectl -scdmnstxyCDMNTXY --dskfilt sd -f /var/log/collectl --rawtoo -i1 -F60 --export graphite,10.0.0.11:2003,s=cdmnstxyCDMNTXY,i=1
