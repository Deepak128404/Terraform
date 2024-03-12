terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

#Defining Backend
  backend "s3" {
    bucket         = "my-tf-test-bucket-terraform"
    key            = "dev/my-app/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
    # If using a custom attribute name for the DynamoDB table, specify it here
    # lock_table = "YourCustomAttributeName"
  }


}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

# Defining Instance Type & Instance Image
resource "aws_instance" "app_server" {
  ami           = "ami-0ba259e664698cbfc" 
  instance_type = "t2.micro"
}
