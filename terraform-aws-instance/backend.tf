terraform {
  backend "s3" {
    bucket         = "cloud-devops-isra-ashfaq" # Pre-created S3 bucket
    key            = "terraform.tfstate"
    region         = "eu-north-1"  # Changed from us-east-1 to eu-north-1
    dynamodb_table = "terraform-locks"        # Pre-created DynamoDB table
    encrypt        = true
  }
}
