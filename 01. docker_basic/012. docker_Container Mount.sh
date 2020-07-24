#!/bin/bash

mkdir -p /var/www/html
echo "Hello world!" > /var/www/html/index.html
  # create directory and 'index.html' file
docker container run -d --name web5 -v '/var/www/html/index.html:/usr/local/apache2/htdocs/index.html' httpd:latest
  # mounted 'index.html'
docker container run -d --name web10 -v '/var/www/html/index.html:/usr/local/apache2/htdocs/index.html:ro' httpd:latest
  # mounted 'index.html' as read-only

mkdir contents
docker container run -itd --name os10 -v '/home/student/contents:/contents' centos:latest
  # mounted 'contents' directory