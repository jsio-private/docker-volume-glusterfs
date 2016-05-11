#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
. shared.sh

# Template the dockerfile\
perl -p -e 's/\$\{([^}]+)\}/defined $ENV{$1} ? $ENV{$1} : $&/eg' < Dockerfile.template > Dockerfile

docker build \
  -t $CONTAINER_NAME \
  $DIR
