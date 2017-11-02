# Specify the provider and access details
provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "web" {
  instance_type = "${var.instance_type}"
  # Lookup the correct AMI based on the region
  # we specified
  ami = "${var.ami}"
  # The name of our SSH keypair you've created and downloaded
  # from the AWS console.
  key_name = "${var.key_name}"

  user_data              = "${file("userdata.sh")}"

  #Instance tags

  tags {
    Name = "Sonarqube"
  }

provisioner "file" {
  source      = "sonar.properties"
  destination = "/opt/sonar/conf/sonar.properties"
}
}

