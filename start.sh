#!/bin/bash

# HERE FOR DEBUGGING
# USE DOCKER COMPOSE INSTEAD

CONFIG="${CONFIG:=.}"
STATIC="${STATIC:=./static}"

docker build . -t icecast2
docker run \
  -p 80:8000 \
  -v "${CONFIG}/icecast.xml":/etc/icecast2/icecast.xml \
  -v "${STATIC}":/usr/share/icecast2/web/static \
  icecast2