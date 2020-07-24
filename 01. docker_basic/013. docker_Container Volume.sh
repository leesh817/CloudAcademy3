#!/bin/bash

docker volume create vol1
  # volume create
docker run -d --name db5 -v 'vol1:/var/lib/mysql' -e "MYSQL_ROOT_PASSWORD=1234" mysql:5.7
  # mounted vol1
docker run -itd --name os0 -v 'vol2:/' centos:latest
  # mounted without creating vol2