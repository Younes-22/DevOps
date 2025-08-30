resource "aws_instance" "WordpressEc2" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  security_groups = [aws_security_group.ec2_sg.id]
  key_name               = "aws-labs"
  user_data              = <<-EOT
#!/bin/bash
# Update packages
apt-get update -y
apt-get upgrade -y

# Install Apache, PHP, and required extensions
apt-get install -y apache2 php php-mysql libapache2-mod-php wget unzip

# Start and enable Apache
systemctl start apache2
systemctl enable apache2

# Download and set up WordPress
cd /tmp
wget https://wordpress.org/latest.zip
unzip latest.zip
cp -r wordpress/* /var/www/html/

# Configure WordPress to use RDS
cd /var/www/html/
cp wp-config-sample.php wp-config.php

# Replace these values with your RDS configuration
RDS_ENDPOINT=RDS_ENDPOINT="${module.rds.db_instance_endpoint}"
RDS_DB_NAME="${module.rds.db_name}"
RDS_USERNAME="${module.rds.db_username}"
RDS_PASSWORD="${module.rds.db_password}"

sed -i "s/database_name_here/$RDS_DB_NAME/" wp-config.php
sed -i "s/username_here/$RDS_USERNAME/" wp-config.php
sed -i "s/password_here/$RDS_PASSWORD/" wp-config.php
sed -i "s/localhost/$RDS_ENDPOINT/" wp-config.php

# Set proper file permissions
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/

# Restart Apache
systemctl restart apache2

  EOT
  tags = {
    Name = "WordpressEc2"
  }
}


resource "aws_security_group" "ec2_sg" {
  name        = "ec2-security-group"
  description = "Allow HTTP/HTTPS inbound and all outbound"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP from anywhere"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTPS from anywhere"
  }

  # Optional SSH for troubleshooting
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["51.14.123.107/32"]
    description = "Allow SSH from my IP"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
}