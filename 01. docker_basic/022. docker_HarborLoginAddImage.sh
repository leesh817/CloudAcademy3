#!/bin/bash

  # Harbor login
docker login -u admin -p Harbor12345 192.168.122.101

  # Harbor Image Add
docker tag hello:v1 192.168.122.101/library/hello:v1
docker push 192.168.122.101/library/hello:v1