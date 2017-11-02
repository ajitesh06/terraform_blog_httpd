provider "aws" {
 access_key = "${var.aws_access_key}"
 secret_key = "${var.aws_secret_key}" 
 region = "${var.aws_region}"
}

resource "aws_instance" "web" {
  instance_type = "${var.instance_type}"
  ami = "${var.ami}"
  key_name = "${var.key_name}"

  user_data              = "${file("userdata.sh")}"

  tags {
    Name = "gitlabs"
  }
}

