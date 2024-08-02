terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"  // Source of the AWS provider
      version = "~> 4.18.0"      // Version of the AWS provider to be used
    }
  }

  backend "s3" {
    bucket         = "" // Name of the S3 bucket where the Terraform state file will be stored
    key            = "" // Path within the bucket to store the state file
    region         = ""  // AWS region where the S3 bucket is located
    dynamodb_table = "" // DynamoDB table used for state locking to prevent concurrent modifications
  }
}
