# Terraform modules and workspaces

## Modules

Follow directory structure

## Workspaces:
To use workspace in .tf file use lookup() and terraform.workspace to get current workspace

```hcl

module "ec2module" {
  source        = "../../modules/ec2"
  aws_region    = var.aws_region
  ami_id        = data.aws_ami.amazon.id
  instance_type = lookup(var.instance_type_var, terraform.workspace)
}


variable "instance_type_var" {
  type = map(any)
  description = "value"
  default = {
    prod    = "t3.biggest"
    stage   = "t3.medium"
    default = "t3.micro"
  }
}```