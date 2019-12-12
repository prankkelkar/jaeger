#!/bin/bash

set -e

docker version

# Install docker-compose
if [[ $(uname -m) == 's390x' ]]; then
    sudo pip install docker-compose==1.8.0
else
    sudo rm -f /usr/local/bin/docker-compose
    curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /tmp/docker-compose
    chmod +x /tmp/docker-compose
    sudo mv /tmp/docker-compose /usr/local/bin
fi  

docker-compose version
