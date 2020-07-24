#!/bin/bash

sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
wget https://github.com/goharbor/harbor/releases/download/v1.10.4/harbor-offline-installer-v1.10.4.tgz
tar zxf harbor-offline-installer-v1.10.4.tgz
cd harbor
vi harbor.yml
  # edit file
sudo vi /etc/docker/daemon.json
  #  {
  #      "insure-registries" : ["192.168.122.101"]
  #  }
sudo vi /etc/hosts
  #  192.168.122.101 cccr3test.docker.com
sudo -i
cd /usr/bin
ln -s /usr/local/bin/docker-compose docker-compose
exit
sudo systemctl restart docker
docker rm -f $(docker ps -aq)
sudo ./install.sh
docker ps -a