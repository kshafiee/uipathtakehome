output "ec2_instances" {
  value = aws_instance.web[*].id
}

output "eks_cluster_name" {
  value = aws_eks_cluster.example.name
}

