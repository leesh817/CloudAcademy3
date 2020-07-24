#!/bin/bash

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo http://download.docker.com/linux/centos/docker-ce.repo
yum repolist
sudo yum install -y docker-ce docker-ce-cli(client 도구) containerd.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker leesh