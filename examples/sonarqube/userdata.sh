#!/bin/bash
sudo yum update -y
#deleting old java
sudo yum remove java-1.7.0* -y

#install java
sudo yum install java-1.8.0-openjdk.x86_64 -y
sudo cp /etc/profile /etc/profile_backup
echo 'export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk' | sudo tee -a /etc/environment
echo 'export JRE_HOME=/usr/lib/jvm/jre' | sudo tee -a /etc/environment 
source /etc/environment

#install SonarQube
sudo wget -O /etc/yum.repos.d/sonar.repo http://downloads.sourceforge.net/project/sonar-pkg/rpm/sonar.repo

sudo yum install sonar -y

sudo service sonar start

sudo chkconfig sonar
