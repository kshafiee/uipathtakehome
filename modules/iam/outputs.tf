output "eks_role_arn" {
  value = aws_iam_role.eks_role.arn
}

output "node_role_arn" {
  description = "The ARN of the IAM role used by EKS worker nodes"
  value       = aws_iam_role.node_role.arn
}

