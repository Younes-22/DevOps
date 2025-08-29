resource "aws_instance" "WordpressEc2" {
  ami = var.instance_ami
  instance_type = var.instance_type
  subnet_id = data.aws_subnet.default.id
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]
  key_name = "aws-labs"
  user_data              = <<-EOT
#!/bin/bash
# Log everything for debugging
exec > /var/log/user-data.log 2>&1
set -x

# Update packages
apt-get update -y

# Install Apache
apt-get install -y apache2

# Start and enable Apache
systemctl start apache2
systemctl enable apache2

# Write a simple page
echo "<h1>Hello me from $(hostname -f)</h1>" > /var/www/html/index.html

  EOT
    tags = {
        Name = "WordpressEc2"
    }
}

data "aws_vpc" "default" {
    default = true
}

data "aws_subnet" "default" {
    availability_zone =  "eu-west-2a"
    default_for_az = true
}

resource "aws_security_group" "allow_http_ssh" {
  name        = "allow_http_ssh"
  description = "Allow http and ssg inbound traffic and all outbound traffic"
  vpc_id = data.aws_vpc.default.id


  tags = {
    Name = "allow_http_ssh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.allow_http_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.allow_http_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_http_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
