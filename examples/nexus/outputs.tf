output "nexus_IP" {
  value = "${aws_instance.web.public_ip}"
}

