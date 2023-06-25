terraform{
    backend "s3" {
        bucket = "aws8pmdevops123"
        encrypt = true
        key = "terraform.tfstate"
        region = "us-east-1"
        dynamodb_table  = "dynamodb-locking"
    }
}