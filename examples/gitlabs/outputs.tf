output "gitlabs_IP" {
  value = "${aws_instance.web.public_ip}"
}

