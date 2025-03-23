output "ec2_instance_ids" {
  value = aws_instance.web[*].id
  description = "The IDs of the EC2 instances"
}
