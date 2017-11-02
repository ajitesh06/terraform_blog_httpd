#!/bin/bash
sudo yum update -y
sudo yum install yum-utils -y
sudo yum install docker -y
sudo groupadd docker
sudo usermod -aG docker

sudo service docker start
sudo service docker enable

sudo docker pull registry:latest
sudo docker run -d -p 5000:5000 registry:latest

