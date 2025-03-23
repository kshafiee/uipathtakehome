output "eks_cluster_endpoint" {
  description = "EKS API endpoint for staging"
  value       = module.eks.cluster_endpoint
}

output "ec2_instance_ids" {
  description = "List of EC2 instance IDs in staging"
  value       = module.ec2.instance_ids
}

output "vpc_id" {
  description = "VPC ID for staging"
  value       = module.vpc.vpc_id
}

