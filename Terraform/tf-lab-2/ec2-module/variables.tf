variable "instance_ami" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "subnet_id" {
  type        = string
  description = "The Subnet ID to launch the instance in"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID where the security group will be created"
}