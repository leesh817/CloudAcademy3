#!/bin/bash

docker network ls
  # bridge, none, host
docker network create --subnet 172.18.0.0/16 --gateway 172.18.0.1 --driver bridge net1
  # create network
docker container run -d --name os9 --network net1 centos:latest
  # create os9 container with 'net1' network
docker contaienr run -it --name os19 --network none centos:latest
  # create os19 container with 'none' network