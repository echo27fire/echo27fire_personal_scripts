#!/bin/bash
KEY=$(cat ./vault.key)
echo $KEY

# start of docker script
docker run -d --name vaultwarden \
--restart=always \
-v /docker/appdata/vaultwarden:/data/ \
-p  81:80 -e WEBSOCKET_ENABLED=true -p 3012:3012 \
-e ADMIN_TOKEN="$KEY" \ # pulls key from local file.
-e SIGNUPS_ALLOWED=ture \
vaultwarden/server:latest

docker ps -a | grep vaultwarden



