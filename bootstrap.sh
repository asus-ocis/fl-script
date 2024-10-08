#!/usr/bin/env bash
echo "start run bootstrap.sh ..."
ROLE=/workspace/startup/start.sh
ADMINFILE=/workspace/startup/fl_admin.sh
SERVER_CFG=/workspace/startup/fed_server.json
CLIENT_CFG=/workspace/startup/fed_client.json

chmod +x /workspace/startup/*.sh

if [[ -z "${FLSERVER}" ]]; then
        echo "flserver not setting"
else
  if [[ -z "${FLSERVERIP}" ]]; then
        echo "flserver ip not setting"
  else
    echo "add /etc/hosts ..."
    echo "${FLSERVERIP} ${FLSERVER}" >> /etc/hosts
  fi
fi

if [ -f "$ADMINFILE" ]; then
    echo "role: admin ..."
fi


if [ -f "$ROLE" ]; then
    echo "role: server or client ..."
    
    if [ -f "$SERVER_CFG" ]; then
	echo "server: add FQDN to /etc/hosts"
        sed '$s/$/ federated.oneai.twcc.ai/' /etc/hosts > tmp_.txt
	cat tmp_.txt > /etc/hosts
        rm tmp_.txt
    fi

    if [[ -z "${START}" ]]; then
        echo "start.sh  do not start ..."
    else
        if [ "$START" = "AUTO" ]; then
            echo "start.sh auto start ..."
            /workspace/startup/start.sh
        else
            echo "start.sh do not start ..."
        fi
    fi
fi

cd /workspace

echo "Init finish ..."
while true; do sleep 15 ; done
