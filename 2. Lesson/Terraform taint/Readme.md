# Taint

[Link](https://www.terraform.io/docs/cli/commands/taint.html)
The `terraform taint` command manually marks a Terraform-managed resource as tainted, forcing it to be destroyed and recreated on the next apply.    

This command will not modify infrastructure, but does modify the state file in order to mark a resource as tainted. Once a resource is marked as tainted, the next `plan` will show that the resource will be destroyed and recreated and the next `apply` will implement this change.
To taint resource:

```terraform.exe taint aws_instance.devprod```

after `terraform plan` you will see this message

```aws_instance.devprod is tainted, so must be replaced```

That means resource will be mandatory recreated (deleted and created) not changed. 
