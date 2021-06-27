terraform{
    backend "s3" {
        bucket = "awsdevopsweekends123"
        encrypt = true
        key = "terraform.tfstate"
        region = "us-east-1"
    }
}