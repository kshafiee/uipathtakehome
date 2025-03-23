variable "aws_region" {
  default = "us-west-2"
}

variable "ec2_instance_count" {
  default = 1
}

variable "ec2_instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-0b6d6dacf350ebc82"
}

variable "eks_cluster_name" {
  default = "my-eks-cluster"
}

variable "eks_node_group" {
  type = map(string)
  default = {
    instance_type = "t3.medium"
    desired_size  = 1
    min_size      = 1
    max_size      = 1
  }
}

