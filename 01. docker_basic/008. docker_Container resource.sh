#!/bin/bash

docker container stats
docker top <containerID>

docker container run -it --name os4 --cpus 0.3 centos:latest
docker container run -itd --name os5 --memory 1024MB centos:lateest
docker container update --memory 2048MB os5