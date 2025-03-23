module "ec2" {
  source          = "./modules/ec2"
  instance_count  = var.ec2_instance_count
  instance_type   = var.ec2_instance_type
  ami_id          = var.ami_id
}

/*
module "eks" {
  source      = "./modules/eks"
  cluster_name = var.eks_cluster_name
  node_group  = var.eks_node_group
}
*/

