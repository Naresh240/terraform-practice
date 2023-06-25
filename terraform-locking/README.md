# Terraform Refresh

## Pre-Requisites:

```bash
Install Terraform
Create S3 Bucket
Create DynamoDB
```

## Create DynamoDB Table

![dynamodb_creation](./documents/dynamodb_table_creation.png)

## S3 Bucket
![S3Bucket](./documents/s3bucket.png)

## Here is a state locking script

```terraform
terraform{
    backend "s3" {
        bucket = "aws8pmdevops123"
        encrypt = true
        key = "terraform.tfstate"
        region = "us-east-1"
        dynamodb_table  = "dynamodb-locking"
    }
}
```
## Open two termintals to understand about locking, each terminal using by different users
![Open_Terminals](./documents/terminals.png)

## Run below commands with developer1 adn developer2 respectively

```bash
terraform init
terraform plan
terraform apply
```

## Checking lock on DynamoDB
![DynamoDB_LOCK](./documents/DynamoDBLockID.png)

## Checking lock error in terminal
![Statefile_lock](./documents/Locking_on_Statefile.png)

```Note:``` If second developer wants to run script, need to wait until lock to be release