output "docker" {
  value = "${aws_instance.web.public_ip}"
}
