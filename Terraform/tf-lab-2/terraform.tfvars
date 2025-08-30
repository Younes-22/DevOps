# VPC
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = "10.0.0.0/24"
private_subnet_cidr = "10.0.1.0/24"
private_subnet2_cidr = "10.0.2.0/24"
availability_zone_2a   = "eu-west-2a"
availability_zone_2b   = "eu-west-2b"
global_ipv4_cidr    = "0.0.0.0/0"

# EC2
instance_ami = "ami-046c2381f11878233"

# RDS
db_instance_class = "db.t3.micro"
db_password = "password123"

# WordPress Database Credentials (These were correctly defined in your last .tfvars file)
db_name = "wordpressdb"
db_username = "admin"
