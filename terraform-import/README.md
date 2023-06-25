# Terraform Import

## Pre-Requisites:

```bash
Install Terraform
service should be exist if we want to import
```

## Run below commands

```bash
terraform init
terraform import aws_security_group.allow_ssh <existing-securitygroup-id>
```
