#!/bin/bash

function docker_prep (){
user=$(whoami)
mkdir -p /docker/appdata
mkdir /docker/scripts
mkdir /docker/compose
mkdir /docker/backups
echo "dirs created"
ln -s /home/"$user"/docker
sudo usermod -aG docker "$user"
}

function docker_image_dl () {
COMMAND=$(docker pull)
$COMMAND ghost
$COMMAND portainer/agent:latest
$COMMAND weejewel/wg-easy
$COMMAND jlesage/nginx-proxy-manager
$COMMAND telegraf:latest
}
