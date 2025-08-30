variable "identifier" {
  type = string
  description = "Name/identifier for the RDS instance"
}

variable "db_name" {
  type = string
  description = "Database name"
}

variable "db_username" {
  type = string
  description = "Master username"
}

variable "db_password" {
  type = string
  description = "Master password"
  sensitive = true
}

variable "db_instance_class" {
  type = string
  description = "RDS instance type"
}

variable "private_subnet_ids" {
  type = list(string)
  description = "List of private subnet IDs for the RDS subnet group"
}

variable "vpc_id" {
  type = string
  description = "The VPC ID where the RDS instance will be deployed"
}

variable "ec2_sg_id" {
  type = string
  description = "The security group ID for the EC2 instances"
}
variable "allocated_storage" {
  type = number
  description = "The allocated storage in gigabytes"
  default = 20
}
variable "storage_type" {
  type = string
  description = "The storage type (e.g., gp2, gp3, io1)"
  default = "gp2"
}
variable "engine" {
  type = string
  description = "The database engine (e.g., mysql, postgres)"
  default = "mysql"
}
variable "engine_version" {
  type = string
  description = "The database engine version"
  default = "8.0"
}