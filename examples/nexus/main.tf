# Specify the provider and access details
provider "aws" {
 access_key = "${var.aws_access_key}"
 secret_key = "${var.aws_secret_key}" 
 region = "${var.aws_region}"
}

resource "aws_instance" "web" {
  instance_type = "${var.instance_type}"
  # Lookup the correct AMI based on the region
  ami = "${var.ami}"
  key_name = "${var.key_name}"

  # Our Security group to allow HTTP and SSH access
  user_data              = "${file("userdata.sh")}"

  #Instance tags

  tags {
    Name = "nexus"
  }
}

