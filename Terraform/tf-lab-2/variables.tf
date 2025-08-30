# VPC
variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "public_subnet_cidr" {
  type        = string
  description = "The CIDR block for the public subnet"
}

variable "private_subnet_cidr" {
  type        = string
  description = "The CIDR block for the private subnet"
}
variable "private_subnet2_cidr" {
  type        = string
  description = "The CIDR block for the private subnet 2"
}

variable "availability_zone_2a" {
  type        = string
  description = "The availability zone 2a for the subnets"
  default     = "eu-west-2a"
}

variable "availability_zone_2b" {
  type        = string
  description = "The availability zone 2b for the subnets"
  default     = "eu-west-2b"
}

variable "global_ipv4_cidr" {
  type        = string
  description = "The global IPv4 CIDR block"
}

# EC2
variable "instance_ami" {
  type        = string
  description = "The AMI ID for the EC2 instance"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

# RDS
variable "identifier" {
  type        = string
  description = "Name/identifier for the RDS instance"
  default     = "wordpress-rds"
}

variable "db_instance_class" {
  type        = string
  description = "RDS instance type"
  default     = "db.t3.micro"
}

variable "db_name" {
  type        = string
  description = "Database name"
  default     = "wordpressdb"
}

variable "db_username" {
  type        = string
  description = "Master username"
  default     = "admin"
}

variable "db_password" {
  type        = string
  description = "Master password"
  sensitive   = true
}

variable "allocated_storage" {
  type        = number
  description = "Allocated storage in GB"
  default     = 20
}

variable "storage_type" {
  type        = string
  description = "Storage type for RDS"
  default     = "gp2"
}

variable "engine" {
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  type        = string
  default     = "8.0"
}
