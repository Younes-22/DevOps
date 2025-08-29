variable vpc_cidr {
    type = string
    description = "The CIDR block for the VPC"
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr"{
    type = string
    description = "The CIDR block for the public subnet"
    default = "10.0.0.0/24"
}

variable "private_subnet_cidr"{
    type = string
    description = "The CIDR block for the private subnet"
    default = "10.0.1.0/24"
  
}

variable "availability_zone" {
    type = string
    description = "The availability zone for the subnets"
    default = "eu-west-2a"
}

variable "global_ipv4_cidr" {
    type = string
    description = "The global IPv4 CIDR block"
    default = "0.0.0.0/0"
}