module "vpc" {
    source = "./vpc-module"
    vpc_cidr = var.vpc_cidr
}