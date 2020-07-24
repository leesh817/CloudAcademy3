#!/bin/bash

docker run -d -e "MYSQL_ROOT_PASSWORD=1234" --name db1 mysql:5.7
docker run -d -e "MYSQL_USER=wp-admin" -e "MYSQL_PASSWORD=dkagh1." --name db2 mysql:5.7