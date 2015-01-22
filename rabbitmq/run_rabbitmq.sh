#!/bin/bash

container='rabbitmq'
image_repo='rabbitmq'
image_tag='latest'
port=5672

if [[ `sudo docker ps` =~ /^$container$/ ]]; then
    echo container $container is running
elif [[ `sudo docker ps -a` =~ /^$container/ ]]; then
    echo container $container was stopped. Starting...
    sudo docker start $container
else
    sudo docker run -d -p 0.0.0.0:$port:5672 \
        --name $container \
	index.alauda.io/chennanfei/$image_repo:$image_tag rabbitmq-server start
fi

sudo docker logs -f $container
