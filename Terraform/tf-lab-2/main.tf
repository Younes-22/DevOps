# VPC Module
module "vpc" {
  source              = "./vpc-module"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
  global_ipv4_cidr    = var.global_ipv4_cidr
}

# EC2 Module
module "ec2" {
  source       = "./ec2-module"
  instance_ami = var.instance_ami
  instance_type = var.instance_type
  subnet_id    = module.vpc.public_subnet_id
  vpc_id       = module.vpc.vpc_id
}

# RDS Module
module "rds" {
  source             = "./rds-module"
  identifier         = "wordpress-rds"
  db_name            = var.db_name
  db_username        = var.db_username
  db_password        = var.db_password
  db_instance_class  = var.db_instance_class

  private_subnet_ids = [module.vpc.private_subnet1_id, module.vpc.private_subnet2_id] # need at least 2 AZs
  vpc_id             = module.vpc.vpc_id
  ec2_sg_id          = module.ec2.ec2_sg_id
}
