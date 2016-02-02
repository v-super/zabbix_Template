#!/bin/bash
# Script to fetch nginx statuses for tribily monitoring systems

# Set Variables
url="http://127.0.0.1/nginx_status"

# Functions to return nginx stats

function active {
    tsar --nginx -i1 -C |awk '{print $6}'| awk -F "=" '{print $2}' | awk -F "." '{print $1}' 
} 

function reading {
    tsar --nginx -i1 -C |awk '{print $7}'| awk -F "=" '{print $2}' | awk -F "." '{print $1}'
} 

function writing {
    tsar --nginx -i1 -C |awk '{print $8}'| awk -F "=" '{print $2}' | awk -F "." '{print $1}'
} 

function waiting {
     tsar --nginx -i1 -C |awk '{print $9}'| awk -F "=" '{print $2}' | awk -F "." '{print $1}' 
} 

function accepts {
    tsar --nginx -i1 -C |awk '{print $3}'| awk -F "=" '{print $2}' | awk -F "." '{print $1}'
} 

function requests {
    tsar --nginx -i1 -C |awk '{print $5}'| awk -F "=" '{print $2}' | awk -F "." '{print $1}' 
}

function qps {
    tsar --nginx -i1 |tail -5|head -1|awk '{print $9}'|awk -F "." '{print $1}'
}

function handled {
    tsar --nginx -i1 -C |awk '{print $4}'| awk -F "=" '{print $2}' | awk -F "." '{print $1}'
}
# Run the requested function
$1
