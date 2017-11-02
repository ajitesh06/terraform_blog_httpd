#!/bin/bash

sudo yum update -y

#just in case
sudo yum install curl policycoreutils openssh-server openssh-clients postfix -y

sudo service sshd start
sudo service sshd status
sudo service postfix start 
sudo service postfix status

#make sure port 80 is open for http

#installing git-lab
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
sudo yum install gitlab-ce -y


#configure and start gitlab
sudo gitlab-ctl reconfigure



