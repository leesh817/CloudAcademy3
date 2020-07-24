#!/bin/bash

docker container create --name web1 httpd:latest
docker container start web1
docker container create -it --name os1 centos:latest
docker container start -ai os1