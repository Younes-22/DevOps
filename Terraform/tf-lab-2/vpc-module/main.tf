# VPC
resource "aws_vpc" "vpc_terraform" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "main-vpc"
  }
}

# Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc_terraform.id
  availability_zone = var.availability_zone
  cidr_block = var.public_subnet_cidr
  map_public_ip_on_launch = true #Enable auto-assign public IP in the subnet

  tags = {
    Name = "public-subnet"
  }
}

# Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_terraform.id
  availability_zone = var.availability_zone
  cidr_block = var.private_subnet_cidr

  tags = {
    Name = "private-subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_terraform.id

  tags = {
    Name = "Internet-Gateway"
  }
}

# Route Table
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc_terraform.id

  route {
    cidr_block = var.global_ipv4_cidr
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "tf-public-route-table"
  }
}

# Route Table Association
resource "aws_route_table_association" "rta_public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table.id
}


# Security Group

# Elastic IP//

# NAT Gateway //
