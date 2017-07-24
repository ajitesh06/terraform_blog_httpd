#!/bin/bash -v
sudo yum update -y
sudo yum install -y httpd
echo "Hello Terraform World" >> /var/www/html/index.html 
sudo service httpd start
sudo service httpd enable
