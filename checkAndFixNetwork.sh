#!/usr/bin/env bash
urlstatus=$(curl -o /dev/null --silent --head --write-out '%{http_code}' "https://progit1-1.prowell.de/")
if [[ "302" -ne urlstatus ]]; then
        nmcli device disconnect enp0s3 > /dev/null 2>&1  && nmcli device connect enp0s3 > /dev/null 2>&1
fi
