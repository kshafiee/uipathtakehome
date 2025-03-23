output "ec2_instances" {
  value = module.ec2.ec2_instance_ids
  description = "The IDs of the EC2 instances created by the EC2 module"
}

/*
output "eks_cluster_name" {
  value = aws_eks_cluster.example.name
}
*/

