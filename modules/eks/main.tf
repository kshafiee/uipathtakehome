resource "aws_eks_cluster" "example" {
  name     = var.cluster_name
  role_arn = aws_iam_role.example.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

resource "aws_eks_node_group" "example" {
  cluster_name    = aws_eks_cluster.example.name
  node_group_name = "${var.cluster_name}-node-group"
  instance_types  = [var.node_group.instance_type]
  scaling_config {
    desired_size = var.node_group.min_size
    min_size     = var.node_group.min_size
    max_size     = var.node_group.max_size
  }
}

