module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr = "10.0.0.0/16"
  vpc_name = "dev-vpc"
  public_subnet_cidrs = {
    subnet1 = "10.0.1.0/24"
  }
  private_subnet_cidrs = {
    subnet1 = "10.0.2.0/24"
  }
}
