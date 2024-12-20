module "ec2" {
  source = "../../modules/ec2"

  instances = {
    jenkins_master = {
      name      = "jenkins-master"
      ami       = "ami-0e2c8caa4b6378d8c"
      type      = "t2.micro"
      subnet_id = module.vpc.public_subnet_ids[0]
    },
    jenkins_slave = {
      name      = "jenkins-slave"
      ami       = "ami-0e2c8caa4b6378d8c"
      type      = "t2.micro"
      subnet_id = module.vpc.private_subnet_ids[0]
    },
    ansible_server = {
      name      = "ansible-server"
      ami       = "ami-0e2c8caa4b6378d8c"
      type      = "t2.micro"
      subnet_id = module.vpc.private_subnet_ids[0]
    }
  }
  key_name = "Devops_Ubuntu"
}