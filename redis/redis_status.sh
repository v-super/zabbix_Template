#!/bin/bash
METRIC="$1"
HOSTNAME=127.0.0.1
PORT="${2:-6379}"
if [ ${PORT} -eq 6380 ]; then
    password="xxxxxxxx"
elif [ ${PORT} -eq 6382 ]; then
    password="xxxxxxx"
else
    password="test"
fi
#PORT=$2
#(printf "INFO\r\n"; sleep 1;)|nc $HOSTNAME $PORT |awk  -F ':|,' '/'"${METRIC}"':/ {print $2}'|sed "s/[^0-9]//g"
(printf "INFO\r\n"; sleep 1;)|/usr/local/redis/src/redis-cli  -h $HOSTNAME -p $PORT -a ${password}|awk  -F ':|,' '/'"${METRIC}"':/ {print $2}'|sed "s/[^0-9]//g"
