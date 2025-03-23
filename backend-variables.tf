variable "s3_bucket_name" {
  description = "Name of the S3 bucket for storing Terraform state"
  default     = "uipathtakehome-state-bucket"
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table for state locking"
  default     = "terraform-lock-table"
}

variable "region" {
  description = "AWS region for the S3 bucket and DynamoDB table"
  default     = "us-west-2"
}

