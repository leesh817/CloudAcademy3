#!/bin/bash

docker run -d --name web1 httpd:latest
docker container cp /var/www/html/index.html web1:/usr/local/apache2/htdocs