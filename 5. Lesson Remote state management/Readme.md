# Remote state management

## Secrets

      password             = file("password_outside_of_the_repo")

## Modules

[Link](https://www.terraform.io/docs/language/modules/sources.html#github)   

Source modules from the github, refere branch as `ref=terraform011`   

```hcl
module "vpc" {
  source = "git@github.com:terraform-aws-modules/terraform-aws-vpc.git?ref=terraform011"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
```

`terraform init` will download module to the `.terraform\modules` path