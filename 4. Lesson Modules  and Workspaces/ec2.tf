resource "aws_instance" "myec2" {
  ami                    = data.aws_ami.amazon.id
  instance_type          = "t3.micro"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1",
      "sudo systemctl start nginx",
      "sudo yum install -y nano"
    ]

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = file("./EC2_Tutor-eu-north-1")
    }
  }

    provisioner "remote-exec" {
    on_failure = continue
    inline = [
      "sudo amazon-linux-extras install -y nginx",
    ]

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = file("./EC2_Tutor-eu-north-1")
    }
  }

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


  provisioner "local-exec" {
    command = "echo ${self.private_ip} > private_ips.txt"
  }
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> private_ips.txt"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "allow_ssh security"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    self        = false
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    self        = false
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
}

output "ip" {
  value = aws_instance.myec2.public_ip
}