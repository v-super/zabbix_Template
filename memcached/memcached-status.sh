#!/bin/bash 
item=$1
#ip=127.0.0.1
ip=10.10.110.31
port=11211
#(echo -e "stats";sleep 0.5) | telnet $ip $port 2>/dev/null | grep "STAT $item\b" | awk '{print $3}'
echo -e "stats\nquit\r\n" | nc $ip $port | grep "STAT $item\b" | awk '{print $3}'
