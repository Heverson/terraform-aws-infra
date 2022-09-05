terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "dev_app" {
  count = 3  
  ami = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  subnet_id = "subnet-0421c58519e6a0e11"

  tags = {
    Name = "dev${count.index}ServerInstance"
  }

  vpc_security_group_ids = [ "${aws_security_group.access_ssh.id}" ]
}

resource "aws_instance" "dev4" {
  ami = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  subnet_id = "subnet-0421c58519e6a0e11"

  tags = {
    Name = "dev4ServerInstance"
  }

  vpc_security_group_ids = [ "${aws_security_group.access_ssh.id}" ]
  depends_on = [
    aws_s3_bucket.dev4
  ]
}

resource "aws_instance" "dev5" {
  ami = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  subnet_id = "subnet-0421c58519e6a0e11"

  tags = {
    Name = "dev5ServerInstance"
  }

  vpc_security_group_ids = [ "${aws_security_group.access_ssh.id}" ]
}

resource "aws_security_group" "access_ssh" {
  name        = "access_ssh"
  description = "Access SSH"
  vpc_id      = "vpc-0e54669a9d70cc13a"

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["177.73.98.221/32"]
  }

  tags = {
    Name = "ssh"
  }
}

resource "aws_s3_bucket" "dev4" {
  bucket = "hrolim-dev4"
  
  tags = {
    Name = "hrolim-dev4"
  }
}

resource "aws_s3_bucket_acl" "dev4_acl" {
  bucket = aws_s3_bucket.dev4.id
  acl    = "private"
}