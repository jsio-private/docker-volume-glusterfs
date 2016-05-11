#!/bin/bash

CONTAINER_NAME="docker-volume-glusterfs"

export ORIGIN_URL=`git config --get remote.origin.url`

if [[ $ORIGIN_URL =~ .*git@.* ]]; then
  # ssh
  export ORIGIN_PATH=`echo $ORIGIN_URL | awk -F ":" '{print $2}' | awk -F "." '{print $1}'`
else
  # http
  export ORIGIN_PATH=`echo $ORIGIN_URL | awk -F "/" '{print $4 "/" $5}'`
fi
