# terraform

## Commands

```bash
terraform init
terraform validate -json
terraform fmt [options] [target...]
terraform fmt -check
terraform fmt -diff
terraform plan
terraform apply
terraform destroy

terraform apply -auto-approve  ## if you don't want to provide "yes" while running
terraform destroy -auto-approve  ## if you don't want to provide "yes" while running

terraform state list

terraform destroy -target RESOURCE_TYPE.NAME
terraform destroy -target aws_instance.example[0] -auto-approve

terraform state rm <resource_to_be_deleted>
```