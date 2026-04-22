# Terraform workspace without module

# Pre-Requisites:

```bash
Install Terraform
```
    
# Run below commands

```bash
terraform workspace new dev
terraform workspace select dev

terraform init
terraform plan -var-file=env/dev.tfvars -out=plan/dev.tfplan
terraform apply plan/dev.tfplan

terraform workspace new stage
terraform workspace select stage

terraform init
terraform plan -var-file=env/stage.tfvars -out=plan/stage.tfplan
terraform apply plan/stage.tfplan
```
