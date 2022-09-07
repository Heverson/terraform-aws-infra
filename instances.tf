
resource "aws_instance" "dev_app" {
  count = 3  
  ami = var.amis["us-east-1"]
  instance_type = var.instance_type
  key_name = var.keyname_ssh_access
  subnet_id = var.sub_nets["us-east-1"]

  tags = {
    Name = "dev${count.index}ServerInstance"
  }

  vpc_security_group_ids = [ "${aws_security_group.access_ssh.id}" ]
}

resource "aws_instance" "dev4" {
  ami = var.amis["us-east-1"]
  instance_type = var.instance_type
  key_name = var.keyname_ssh_access
  subnet_id = var.sub_nets["us-east-1"]

  tags = {
    Name = "dev4ServerInstance"
  }

  vpc_security_group_ids = [ "${aws_security_group.access_ssh.id}" ]
  depends_on = [
    aws_s3_bucket.dev4
  ]
}

resource "aws_instance" "dev5" {
  ami = var.amis["us-east-1"]
  instance_type = var.instance_type
  key_name = var.keyname_ssh_access
  subnet_id = var.sub_nets["us-east-1"]

  tags = {
    Name = "dev5ServerInstance"
  }

  vpc_security_group_ids = [ "${aws_security_group.access_ssh.id}" ]
}

resource "aws_instance" "dev6" {
  provider = aws.us-east-2
  ami = var.amis["us-east-2"]
  instance_type = var.instance_type
  key_name = var.keyname_ssh_access
  subnet_id = var.sub_nets.us-east-2

  tags = {
    Name = "dev6ServerInstance"
  }

  vpc_security_group_ids = [ "${aws_security_group.access_ssh_us-east-2.id}" ]
  depends_on = [
    aws_dynamodb_table.dynamodb-homologacao
  ]
}


resource "aws_instance" "dev7" {
  provider = aws.us-east-2
  ami = var.amis["us-east-2"]
  instance_type = var.instance_type
  key_name = var.keyname_ssh_access
  subnet_id = var.sub_nets.us-east-2

  tags = {
    Name = "dev7ServerInstance"
  }

  vpc_security_group_ids = [ "${aws_security_group.access_ssh_us-east-2.id}" ]
}
