variable "aws_region" {
  default = "us-west-2"
}

variable "ec2_instance_count" {
  default = 2
}

variable "ec2_instance_type" {
  default = "t2.micro"
}

variable "ami_id" {}

variable "eks_cluster_name" {
  default = "my-eks-cluster"
}

variable "eks_node_group" {
  type = map(string)
  default = {
    instance_type = "t3.medium"
    min_size      = 1
    max_size      = 3
  }
}

