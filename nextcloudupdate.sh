#!/bin/bash


NEXTCLOUD=$(docker ps | grep nextcloud | cut -f 1  -d ' ')

docker exec $NEXTCLOUD files:scan --all --quiet
