output "s3_bucket_name" {
  value       = aws_s3_bucket.terraform_state.bucket
  description = "The name of the S3 bucket for Terraform state"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_lock.name
  description = "The name of the DynamoDB table for state locking"
}

output "region" {
  value       = var.region
  description = "AWS region of the backend resources"
}

