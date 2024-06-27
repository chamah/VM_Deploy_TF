terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "5.54.1"
        }
    }
}
provider "aws" {
    region     = "us-east-1"
}



resource "aws_instance" "ws2012" {
    ami           = "ami-0f811217032cd31f7"
    instance_type = "t2.micro"
    key_name      = "mahesh_wm"
    vpc_security_group_ids = [aws_security_group.ws2022_sec_grp.id]

    tags = {
        Name = "ws2012"
    }
}

resource "aws_security_group" "ws2022_sec_grp" {
    name        = "allow_ssh"
    vpc_id      = "vpc-09650056d631687b1"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "ws2022_sec_grp"
    }
}
