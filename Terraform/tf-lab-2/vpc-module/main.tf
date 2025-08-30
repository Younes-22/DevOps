# This is a conceptual example for your vpc-module
# vpc-module/main.tf

# VPC
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "wordpress-vpc"
  }
}

# Public Subnet 1
resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.availability_zone_2a
  tags = {
    Name = "public-subnet-1"
  }
}

# Private Subnet 1
resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.1.0/24" # You can adjust this to your liking
  availability_zone = var.availability_zone_2a
  tags = {
    Name = "private-subnet-1"
  }
}

# Private Subnet 2
resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.2.0/24" # You can adjust this
  availability_zone = var.availability_zone_2b
  tags = {
    Name = "private-subnet-2"
  }
}

# Route table, Internet Gateway, and other networking resources...

# RDS Subnet Group
resource "aws_db_subnet_group" "this" {
  name       = "wordpress-rds-subnet-group"
  subnet_ids = [aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id]
}