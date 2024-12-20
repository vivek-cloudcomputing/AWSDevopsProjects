module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr            = var.vpc_cidr
  vpc_name            = var.vpc_name
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "ec2" {
  source = "../../modules/ec2"

  instances = var.instances
  key_name  = var.key_name
  vpc_id    = module.vpc.vpc_id
}
