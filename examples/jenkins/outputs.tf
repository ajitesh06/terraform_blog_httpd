output "Jenkins" {
  value = "${aws_instance.web.public_ip}"
}

