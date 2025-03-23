
module "ec2" {
  source          = "./modules/ec2"
  instance_count  = var.ec2_instance_count
  instance_type   = var.ec2_instance_type
  ami_id          = var.ami_id
}

module "iam" {
  source = "./modules/iam"

  role_name = "eks-cluster-role"
  tags      = {
    Environment = "production"
  }
}

module "vpc" {
  source = "./modules/vpc"
}

module "eks" {
  source      = "./modules/eks"
  cluster_name = var.eks_cluster_name
  node_group  = var.eks_node_group
  role_arn    = module.iam.eks_role_arn
  node_role_arn  = module.iam.node_role_arn
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.private_subnet_ids
}



