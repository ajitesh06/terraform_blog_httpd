#!/bin/bash

sudo yum update -y
sudo yum install wget unzip -y
#installing oracle java 1.8
sudo yum remove java-1.7.0* -y
sudo yum remove java-1.8.0* -y

cd /usr/lib/

sudo wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2Ftechnetwork%2Fjava%2Fjavase%2Fdownloads%2Fjdk8-downloads-2133151.html; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm"

sudo yum localinstall jdk-8u131-linux-x64.rpm -y

sudo rm -rf jdk-8u131-linux-x64.rpm

#setting up JAVA_HOME path for all users

sudo echo "export JAVA_HOME=/usr/java/jdk1.8.0_131/jre" >> /etc/environment
source /etc/environment

#installing nexus2.x server for RDOPS
cd /home/ec2-user/
wget http://www.sonatype.org/downloads/nexus-latest-bundle.zip
unzip nexus-latest-bundle.zip
sudo rm nexus-latest-bundle.zip
mv nexus-*  nexus

sudo chown -R ec2-user:ec2-user nexus
sudo chown -R ec2-user:ec2-user sonatype-work

#starting the service
./home/ec2-user/nexus/bin/nexus start

#insralling nexus3.x server for RDOPS
cd /home/ec2-user
wget http://download.sonatype.com/nexus/3/latest-unix.tar.gz
tar zxvf latest-unix.tar.gz
rm -rf latest-unix.tar.gz
mv nexus-*  nexus

sudo chown -R ec2-user:ec2-user nexus
sudo chown -R ec2-user:ec2-user sonatype-work
#starting the service
./home/ec2-user/nexus/bin/nexus run

