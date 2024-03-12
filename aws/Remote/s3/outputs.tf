output "s3_bucket_name" {
  value       = aws_s3_bucket.example.id
  description = "The NAME of the S3 bucket"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_lock.name
  description = "The NAME of the DynamoDB table"
}
