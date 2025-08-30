variable "rds_endpoint" {
  type = string
  description = "The RDS endpoint to connect to"
}

variable "rds_db_name" {
  type = string
  description = "The name of the database in RDS"
}

variable "rds_db_username" {
  type = string
  description = "The username for the database in RDS"
}

variable "rds_db_password" {
  type = string
  description = "The password for the database in RDS"
  sensitive = true
}

variable "instance_ami" {
  type = string
  description = "The AMI ID for the EC2 instance"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "subnet_id" {
  type = string
  description = "The subnet ID where the EC2 instance will be deployed"
}

variable "vpc_id" {
  type = string
  description = "The VPC ID where the EC2 instance will be deployed"
}
