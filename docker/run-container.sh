#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
. shared.sh


docker run -it \
  -v /var/lib/:/host/var/lib \
  -v /run/docker:/run/docker \
  -v $DIR/../:/go/src/github.com/$ORIGIN_PATH \
  $CONTAINER_NAME \
  $1
