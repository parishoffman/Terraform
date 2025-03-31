module "vpc" {
  source    = "./vpc"
  namespace = var.namespace
}

module "ssh-key" {
  source    = "./ssh-key"
  namespace = var.namespace
}

module "ec2" {
  source    = "./ec2"
  namespace = var.namespace
  vpc = module.vpc.vpc
  sg_pub_id = module.vpc.sg_pub_id
  # sg_priv_id = module.vpc.sg_priv_id
  key_name = module.ssh-key.key_name
  ami_id = var.ami_id
}