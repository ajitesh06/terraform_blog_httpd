# Specify the provider and access details
provider "aws" {

 region = "${var.aws_region}"
}

resource "aws_instance" "web" {
  instance_type = "${var.instance_type}"
  # Lookup the correct AMI based on the region
  # we specified
  ami = "${var.ami}"
  key_name = "${var.key_name}"
  # To create instances in specific vpc and subnet
  #vpc_security_group_ids = [""]
  #subnet_id = ""

  # Our Security group to allow HTTP and SSH access
  user_data              = "${file("userdata.sh")}"
  #Instance tags
  root_block_device {
  volume_type= "gp2"
  volume_size= 20
  }

  tags {
    Name = "Jenkins"
  }
}
