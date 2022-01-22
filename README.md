# terraform-aws-vpc

**NOTE**: This is not free. There are costs when running this repository such as. internet gateway (having 1 internet gateway is free, but chances are you haven't removed the default one).

Creates a internet gateway, 3 public subnets, route table and route table association.

I didn't include NAT gateway to this repo, but it's easy to add.

Variables are inside `variables.tf` file like this:

```
variable "project_name" {
  default     = ""
  type        = string
}

variable "region" {
  default     = ""
  type        = string
}

variable "vpc_cidr_block" {
  default     = ""
  type        = string
}

variable "availability_zones" {
  default     = []
  type        = list
}

variable "public_subnets" {
  default     = []
  type        = list
}
```

Add values inside default.

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

You can also specify variables on the command line:

**Note:** You can use apply and plan commands.

```
terraform plan -var="region=us-east-1"
terraform apply -var="region=us-east-1"
```
