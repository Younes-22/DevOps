variable "vpc_cidr" {
  type = string
    description = "The CIDR block for the VPC"
}

variable "public_subnet_cidr" {
  type = string
    description = "The CIDR block for the public subnet"
}

variable "private_subnet_cidr" {
  type = string
    description = "The CIDR block for the private subnet"
}

variable "availability_zone_2a" {
  type = string
  description = "The availability zone 2a for the subnets"
}

variable "availability_zone_2b" {
  type = string
    description = "The availability zone 2b for the subnets"
}

variable "global_ipv4_cidr" {
  type = string
    description = "The global IPv4 CIDR block"
}