#!/bin/bash
dd if=/dev/random bs=256 count=1 | od -An -vtd1 -w1 | while read i; do sleep 1; curl -i -XPOST 'http://localhost:8086/write?db=test' --data-binary "random8b,host=localhost value=$i"; done &
dd if=/dev/random bs=512 count=1 | od -An -vtd2 -w2 | while read i; do sleep 1; curl -i -XPOST 'http://localhost:8086/write?db=test' --data-binary "random16b,host=localhost value=$i"; done &
dd if=/dev/random bs=1024 count=1 | od -An -vtd4 -w4 | while read i; do sleep 1; curl -i -XPOST 'http://localhost:8086/write?db=test' --data-binary "random32b,host=localhost value=$i"; done &
dd if=/dev/random bs=2048 count=1 | od -An -vtd8 -w8 | while read i; do sleep 1; curl -i -XPOST 'http://localhost:8086/write?db=test' --data-binary "random64b,host=localhost value=$i"; done &

