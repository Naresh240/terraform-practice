terraform {
  backend "s3" {
    bucket = "awsdevops9am-backend-terraform"
    key    = "terraform.tfstate"
    encrypt = true
    region = "us-east-1"
  }
}