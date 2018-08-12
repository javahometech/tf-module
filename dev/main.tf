# Configuration related to dev env
provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "../modules/vpc"

  vpc_cidr    = "10.190.0.0/16"
  tenancy     = "default"
  subnet_cidr = "10.190.1.0/24"
  vpc_id      = "${module.vpc.vpc_id}"
}

# Add Ec2 Instances to VPC

module "subnets" {
  source    = "../modules/ec2"
  subnet_id = "${module.vpc.subnet_id}"
}
