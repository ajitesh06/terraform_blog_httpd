variable "aws_access_key" {
  description = "place your aws access key here"
  default = "XXXXXXXXXXXXXXXXXXXXXX" 
}
variable "aws_secret_key"{
  description = "place your aws secret key here"
  default = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
}
variable "key_name" {
   description = "provide your keypair here"
  default = ""
}
variable "aws_region" {
  description = " specify the region in which you want to deploy"
  default = ""
}
variable "ami" {
  description = " specify the ami"
  default = ""
}
variable "instance_type" {
  description = " type of instance you want to create"
  default = ""
}

