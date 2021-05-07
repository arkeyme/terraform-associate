# Terraform provisioners

Remote provisioner:

```hcl
provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1",
      "sudo systemctl start nginx"
    ]

  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    private_key = file("./EC2_Tutor-eu-north-1")
  }
  }
```
Local Provisioners:
```hcl
  provisioner "local-exec" {
    command = "echo ${self.private_ip} > private_ips.txt"
  }
    provisioner "local-exec" {
    command = "echo ${self.public_ip} >> private_ips.txt"
  }
```
## Execute on Destroy

If `when = destroy` is specified, the provisioner will run when the resource it is defined within is destroyed.


```hcl
  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo yum remove -y nano"
    ]

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = file("./EC2_Tutor-eu-north-1")
    }
  }
```

## Behavior on failure

By default, provisioners that fail will also cause the Terraform apply itself to fail. The on_failure setting can be used to change this. The allowed values are:   

`continue` - Ignore the error and continue with creation or destruction.   

`fail` - Raise an error and stop applying (the default behavior). If this is a creation provisioner, taint the resource.   

```hcl
    provisioner "remote-exec" {
    on_failure = continue
    inline = [
      "sudo amazon-linux-extras install -y nginx"
    ]

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = file("./EC2_Tutor-eu-north-1")
    }
  }
```