module "ec2module" {
    source = "../../modules/ec2"
    aws_region = var.aws_region
    ami_id = data.aws_ami.amazon.id
}