#!/bin/bash

docker run -d --name wp-db -v 'wp-db-vol:/var/lib/mysql' -e 'MYSQL_ROOT_PASSWORD=dkagh1.' -e 'MYSQL_USER=wp-admin' -e 'MYSQL_PASSWORD=dkagh1.' -e 'MYSQL_DATABASE=wordpress' mysql:5.7
docker run -d --name wp-web -v 'wp-web-vol:/var/www/html' -e 'WORDPRESS_DB_HOST=wp-db' -e 'WORDPRESS_DB_USER=wp-admin' -e 'WORDPRESS_DB_PASSWORD=dkagh1.' -e 'WORDPRESS_DB_NAME=wordpress' -p 8080:80 --link wp-db wordpress:latest