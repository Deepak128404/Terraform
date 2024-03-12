terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-terraform"

  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID" # Changed from 'Id' to 'LockID'
    type = "S"
  }

  hash_key = "LockID" # Changed from 'Id' to 'LockID'
}
