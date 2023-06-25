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

terraform refresh                                                        ## To refresh statefile, if any changes done manually
terraform import <resoure_type>.<resource_name> <service_id_in_cloud>    ## Resource created manually, then wants to manage with terraform

terraform apply -auto-approve                                            ## if you don't want to provide "yes" while running
terraform destroy -auto-approve                                          ## if you don't want to provide "yes" while running

terraform state list

terraform destroy -target RESOURCE_TYPE.NAME
terraform destroy -target aws_instance.example[0] -auto-approve

terraform state rm <resource_to_be_deleted>
```
