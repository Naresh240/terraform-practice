# terraform-workspace-with-module

Short README: how this workspace uses a local `instance` module with region-aware variables and Terraform workspaces (dev/stage/prod).

What this workspace expects
- `variables.tf` defines `instance_ami` and `key_name` as map(string). The root `main.tf` calls the module with:
  - `instance_ami = lookup(var.instance_ami, var.region)`
  - `key_name = lookup(var.key_name, var.region)`
- There are example per-environment varfiles in `environments/` (`dev.tfvars`, `stage.tfvars`, `prod.tfvars`) that set `region` and `inst_count`.

Quick usage (one-time init)

```bash
cd terraform-practice/terraform-workspace-with-module
terraform init
```

Create/select workspaces and run

```bash
# create or select a workspace (do this once per environment)
terraform workspace new dev || terraform workspace select dev
terraform workspace new stage || terraform workspace select stage
terraform workspace new prod || terraform workspace select prod

# select the workspace you want to work in, then plan/apply with the matching var-file
terraform workspace select dev
terraform plan -var-file=environments/dev.tfvars
terraform apply -var-file=environments/dev.tfvars
```

Notes on region-aware variables
- Because `instance_ami` and `key_name` are maps, the module (and root) use `lookup(var.instance_ami, var.region)` to pick the AMI/key for the selected `region`.
- The default maps are defined in `variables.tf`; you can override them per-run by passing a map in a tfvars file. Example override in a varfile if you need a custom AMI for a region:

```hcl
instance_ami = {
  "us-east-1" = "ami-0123456789abcdef0"
}
region = "us-east-1"
inst_count = 1
```

Alternative: single-value AMI/key
- If you prefer to pass a single AMI string rather than a map, either:
  - Update the module to accept a string (or support both string/map), or
  - In your varfile pass a one-key map keyed by the `region` you will use (as shown above).

Validation
- `variables.tf` already validates `region` against the keys of `instance_ami`; make sure your `region` value exists in the AMI map or provide an override map that contains it.

That's it — this folder is ready to be used with Terraform workspaces and the local `instance` module. If you'd like, I can:
- Add example override tfvars per environment that include custom AMIs/keys, or
- Make the module accept either a string or a map for backward compatibility.
