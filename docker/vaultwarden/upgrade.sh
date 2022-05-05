#!/bin/bash
echo "stopping vaultwarden" 
docker stop vaultwarden 1>/dev/null
echo "removing vaultwarden"
docker rm vaultwarden 1>/dev/null
