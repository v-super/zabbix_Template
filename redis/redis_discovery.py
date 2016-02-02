#!/usr/bin/env python
#zabbix ALL=NOPASSWD: /bin/netstat
import os
import json
t=os.popen("""sudo /bin/netstat -nlput|awk -F":" '/redis/ {print $0}'|awk -F: '{print $2}'|awk '{print $1}'|grep -v "^$" """)
ports = []
for port in  t.readlines():
        r = os.path.basename(port.strip())
        ports += [{'{#REDISPORT}':r}]
print json.dumps({'data':ports},sort_keys=True,indent=4,separators=(',',':'))
