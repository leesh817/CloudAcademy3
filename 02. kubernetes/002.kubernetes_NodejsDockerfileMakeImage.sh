#!/bin/bash

mkdir test
cd test
vi 002.01.index.js
vi 002.02.Dockerfile
sudo docker image build --network host -t myweb .

sudo docker run -d -p 8080:8080 --name test myweb:latest
curl http://localhost:8080
sudo docker rm -f test

sudo docker login
sudo docker image tag myweb:latest leeseonhyo817/myweb:v1
sudo docker push leeseonhyo817/myweb:v1
sudo docker image tag myweb:latest leeseonhyo817/myweb:latest
sudo docker push leeseonhyo817/myweb:latest