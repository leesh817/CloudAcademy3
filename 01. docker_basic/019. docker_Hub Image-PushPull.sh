#!/bin/bash

docker image tag httpd:latest leeseonhyo817/hello:v1
docker push leeseonhyo817/hello:latest

docker pull leeseonhyo817/hello:latest