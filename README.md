The example launches a Http server on aws, installs httpd server, Runs a simple html page on port 80.

To run, configure your AWS provider as described in https://www.terraform.io/docs/providers/aws/index.html

This example assumes you have created a Key Pair. Visit
https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#KeyPairs:sort=keyName
to create a key if you do not have one. 

Enter your aws information in the varibles.tf file before applying

Run this example using:

    terraform apply

Wait a couple of minutes for the EC2 userdata to install httpd, and then enter the ip from outputs into your browser and see the html page

To find more information on Terraform visit my blog https://ajitesh2017.wordpress.com/
