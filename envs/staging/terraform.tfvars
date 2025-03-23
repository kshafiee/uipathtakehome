environment   = "staging"
vpc_cidr      = "10.0.0.0/16"
cluster_name  = "staging-cluster"
instance_type = "t3.small"       # A smaller instance type for staging
node_group = {
  desired_size = 2               # Smaller node group for staging
  max_size     = 4
  min_size     = 1
}
aws_region    = "us-west-2"

