module "vpc" {
  source      = "../../modules/networking"
  cidr_block  = var.vpc_cidr
  tags        = {
    Environment = var.environment
    Name        = "staging-vpc"
  }
}

module "iam" {
  source      = "../../modules/iam"
  environment = var.environment
}

module "eks" {
  source         = "../../modules/eks"
  cluster_name   = var.cluster_name
  subnet_ids     = module.vpc.private_subnets
  role_arn       = module.iam.eks_role_arn
  node_group     = var.node_group
}

module "ec2" {
  source         = "../../modules/ec2"
  instance_type  = var.instance_type
  subnet_id      = module.vpc.public_subnet
}

