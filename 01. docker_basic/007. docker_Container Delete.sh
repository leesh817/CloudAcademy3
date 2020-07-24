#!/bin/bash

docker container stop os3
docker container rm os3
docker container rm <os3 ID>
docker container rm -f os2
docker container rm -f <os2 ID>