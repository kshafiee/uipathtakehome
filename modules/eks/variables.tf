variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs to be used for the EKS cluster"
  type        = list(string)
}

variable "node_group" {
  description = "Configuration for the EKS node group"
  type        = object({
    instance_type = string
    min_size      = number
    max_size      = number
    desired_size  = number
  })
}

variable "role_arn" {
  description = "The ARN of the IAM role to use for the EKS cluster"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

