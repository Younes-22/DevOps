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

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for RDS subnet group"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where RDS will be deployed"
}

variable "ec2_sg_id" {
  type        = string
  description = "Security group ID of the EC2 instances that can access RDS"
}
