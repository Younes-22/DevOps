terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.10.0"
    }
  }
  backend "s3" {
    bucket = "terraform-state-younes"
    key = "terraform.tfstate"
    region = "eu-west-2"
  }
}

provider "aws" {
  # Configuration options
}
