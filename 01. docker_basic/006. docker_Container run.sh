#!/bin/bash

docker container run -d --name web2 httpd:latest
docker container run -it --name os2 centos:latest
docker container run -itd --name os3 centos:latest

docker container attach os2
docker container exec -it os3 bash