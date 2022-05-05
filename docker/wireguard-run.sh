#!/bin/bash

docker run -d -e WG_HOST=45.33.88.16 -e PASSWORD=SVmZuZ#274xk4X -v /docker/appdata/wg-easy/:/etc/wireguard -p 51820:51820/udp -p 51821:51821/tcp --cap-add=NET_ADMIN --cap-add=SYS_MODULE --sysctl="net.ipv4.conf.all.src_valid_mark=1" --sysctl="net.ipv4.ip_forward=1" --restart unless-stopped weejewel/wg-easy
