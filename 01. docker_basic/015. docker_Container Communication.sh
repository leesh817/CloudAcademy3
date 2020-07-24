#!/bin/bash

// container communication: Link
docker container run -itd --name con1 centos:latest
docker container run -it --name con2 --link con1 centos:latest
// ping -c 2 con1
// cat /etc/hosts
docker container run -it --name con3 --link con2:new centos:latest
// ping -c 2 new
// cat /etc/hosts

//container communication: Port Forwarding
docker run -d -p 8080:80 --name web1 httpd:latest
// In Ubuntu: $ curl <CentosIP>:8080
docker run -d -p 33333:3306 --name mysql1 -e "MYSQL_ROOT_PASSWORD=1234" mysql:5.7
// In Ubuntu: $ mysql -h <CentosIP> -P 33333 -u root-p 