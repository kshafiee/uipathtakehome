variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instances"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID where the EC2 instances will be launched"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to assign to the EC2 instances"
  type        = map(string)
  default     = {
    Name = "EC2-instance"
  }
}

