terraform {
  backend "s3" {
    bucket         = "demo-dev-terraform-state-bucket"
    key            = "terraform/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "demo-dev-terraform-lock-table"
    encrypt        = true
  }
}