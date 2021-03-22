terraform{
    backend "s3" {
        bucket = "terraform-state-file-storage123"
        encrypt = true
        key = "terraform.tfstate"
        region = "us-east-1"
    }
}