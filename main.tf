terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "better-goals-terraform"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}







resource "aws_s3_bucket" "dummy-bucket" {
  bucket = "delete-me-bucket-2023-04-27"
}
