# Preparation for HashiCorp Infrastructure Automation Certification

https://www.hashicorp.com/certification/terraform-associate

## Hot to find AMIs

```aws ec2 describe-images --region eu-north-1 --owners amazon --filters  "Name=virtualization-type,Values=hvm" "Name=name,Values=amzn2-ami-hvm-2.0*"```

```aws ec2 describe-images --region eu-north-1 --owners amazon --filters  "Name=virtualization-type,Values=hvm"```

You should check `OwnerId` and `Name` of the image
