variable "role_name" {
  description = "Name of the IAM role"
  default     = "eks-cluster-role"
}

variable "tags" {
  description = "Tags to assign to IAM resources"
  type        = map(string)
  default     = {}
}

