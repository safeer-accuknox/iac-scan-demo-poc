terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.64.0"
    }
  }
}

provider "aws" {
  alias  = "default"
  region = "us-east-1"
}

resource "aws_s3_bucket" "this" {
  bucket = "my-unique-bucket-name"
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = true   # Prevents public ACLs from being added
  ignore_public_acls      = true   # Ignores any public ACLs added to the bucket
  block_public_policy     = true   # Prevents public bucket policies
  restrict_public_buckets = true   # Prevents public access to the bucket
}
