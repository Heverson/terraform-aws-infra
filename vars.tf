variable "amis" {
    type = map(string)

    default = {
        "us-east-1" = "ami-052efd3df9dad4825",
        "us-east-2" = "ami-02f3416038bdb17fb"
    }
}

variable "keyname_ssh_access" {
    description = "Key_name ACCESS SSH"
    type = string
    default = "terraform-aws"
}

variable "instance_type" {
    description = "Instance Type"
    type = string
    default = "t2.micro"
}

variable "vpcs" {
    type = map(string)

    default = {
        "us-east-1" = "vpc-0e54669a9d70cc13a",
        "us-east-2" = "vpc-c79793af"
    }
}

variable "sub_nets" {
    type = map(string)

    default = {
        "us-east-1" = "subnet-0421c58519e6a0e11",
        "us-east-2" = "subnet-df6702a5"
    }
}

variable "cdirs_remote_access" {
    type = list(string)

    default = [
        "177.73.98.221/32"
    ]
}