#!/bin/bash

sudo yum update -y
sudo yum install wget unzip -y
#installing oracle java 1.8
sudo yum remove java-1.7.0* -y
sudo yum remove java-1.8.0* -y

cd /usr/lib/

sudo wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2Ftechnetwork%2Fjava%2Fjavase%2Fdownloads%2Fjdk8-downloads-2133151.html; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm"

sudo yum localinstall jdk-8u131-linux-x64.rpm -y

sudo rm -f jdk-8u131-linux-x64.rpm

#setting up JAVA_HOME path for all users

sudo echo "export JAVA_HOME=/usr/java/jdk1.8.0_131/jre" >> /etc/environment
source /etc/environment

#installing jfrog5.4.5 server for RDOPS
sudo wget https://bintray.com/jfrog/artifactory-rpms/rpm -O bintray-jfrog-artifactory-rpms.repo
sudo mv bintray-jfrog-artifactory-rpms.repo /etc/yum.repos.d/
sudo yum install jfrog-artifactory-oss -y
#starting the service
sudo service artifactory start
sudo service artifactory enable
