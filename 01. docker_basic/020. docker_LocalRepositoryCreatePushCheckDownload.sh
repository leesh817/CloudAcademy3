#!/bin/bash

  # local registry create
docker run -d -p 5000:5000 --restart always -v 'vol1:/var/lib/registry' --name registry registry:2

  # image push
docker pull ubuntu:latest
docker tag ubuntu:latest localhost:5000/ubuntu:v1
docker push localhost:5000/ubuntu:v1

  # local registry check
curl -X GET http://localhost:5000/v2/_catalog
curl -X GET http://localhost:5000/v2/tags/list

  # local registry image download
docker pull localhost:5000/ubuntu:latest