
resource "aws_security_group" "access_ssh" {
  name        = "access_ssh"
  description = "Access SSH"
  vpc_id      = var.vpcs["us-east-1"]

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cdirs_remote_access
  }

  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "access_ssh_us-east-2" {
  provider = aws.us-east-2
  name        = "access_ssh"
  description = "Access SSH"
  vpc_id      = var.vpcs["us-east-2"]

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cdirs_remote_access
  }

  tags = {
    Name = "ssh"
  }
}
