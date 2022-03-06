terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "arunkg22bucket2022"
    dynamodb_table = "terraform_locks_db"
    region         = "ap-southeast-2"
    key            = "terraform.tfstate"
  }
}
