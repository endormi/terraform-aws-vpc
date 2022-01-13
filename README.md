# terraform-aws-vpc

**NOTE**: This is still a WIP.

Variables are inside `terraform.tfvars` file like this:

```
project_name              = ""
region                    = ""
vpc_cidr_block            = ""
public_subnet1_cidr_block = ""
public_subnet2_cidr_block = ""
public_subnet3_cidr_block = ""
```

Initialize:

```
terraform init
```

Validate:

```
terraform validate
```

Plan:

```
terraform plan
```

Apply:

```
terraform apply
```
