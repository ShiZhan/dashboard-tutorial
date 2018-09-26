import time
import math
import requests

POST_URL = "http://localhost:8086/write?db=local"
PARAMS   = {'u': 'root', 'p': 'root'}

now = time.time()
points = ["sine value=%f %d000000000" % (math.sin(math.radians(x)), int(now) + x) for x in range(0, 360)]

print("\n".join(points[:3]) + "\n...\n" + "\n".join(points[-3:-1]))

data = ('\n'.join(points) + '\n').encode('utf-8')
r = requests.post(POST_URL, params=PARAMS, data=data)
status_code = r.status_code
if status_code >= 300 or status_code < 200:
    print('Error: ' + status_code)