# VPC
variable vpc_cidr {
    type = string
    description = "The CIDR block for the VPC"
}

variable "public_subnet_cidr"{
    type = string
    description = "The CIDR block for the public subnet"
}

variable "private_subnet_cidr"{
    type = string
    description = "The CIDR block for the private subnet"  
}

variable "availability_zone" {
    type = string
    description = "The availability zone for the subnets"
}

variable "global_ipv4_cidr" {
    type = string
    description = "The global IPv4 CIDR block"
}