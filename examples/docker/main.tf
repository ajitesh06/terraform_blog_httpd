# Specify the provider and access details
provider "aws" {
 access_key = "${var.aws_access_key}"
 secret_key = "${var.aws_secret_key}"
 region = "${var.aws_region}"
}


resource "aws_instance" "web" {
  instance_type = "${var.instance_type}"
  ami = "${var.ami}"  
  key_name = "${var.key_name}"
# For deploying into a specific vpc and subnet
# vpc_security_group_ids = [""]
# subnet_id = ""

  user_data              = "${file("userdata.sh")}"
  root_block_device {
  volume_type= "gp2"
  volume_size= 20
  }

  tags {
    Name = "Docker"
  }
}

