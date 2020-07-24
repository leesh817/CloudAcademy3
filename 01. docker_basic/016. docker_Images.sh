#!/bin/bash

  # Image Archive
docker save -o test.tar centos:latest httpd:latest
docker load -i test.tar

  # Image Tag
docker tag httpd:latest httpd:v1

  # Container make Image
docker run -it --name os-web1 centos:latest
  # yum install -y httpd
docker commit -c 'CMD["httpd","-D","FOREGROUND"]' os-web1 centos-web:v1

  # Container export, import
docker export -o centos-web.tar os-web1
docker import -i centos-web.tar abc:latest