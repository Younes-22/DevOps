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
  cidr_block        = var.private_subnet2_cidr
  availability_zone = var.availability_zone_2b
  tags = {
    Name = "private-subnet-2"
  }
}
# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "wordpress-igw"
  }
}

# Route Table for Public Subnet
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = var.global_ipv4_cidr
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "example"
  }
}
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.rt.id
}