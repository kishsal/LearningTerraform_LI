provider "aws"  {
    profile = "default"
    region = "us-east-1"
}

resource "aws_s3_bucket" "prod_tf_course" {
    bucket = "tf-course-20210913"
    acl = "private"
}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "prod_web" {
    name        = "prod_web"
    description = "Allows http and https for inbound and outbound"
    
    ingress = [{
            description = "HTTP"
            from_port   = 80
            to_port     = 80
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            security_groups = []
            self = true
        },
        {
            description = "HTTPS"
            from_port   = 443
            to_port     = 443
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            security_groups = []
            self = true
         }
    ]

    egress = [{
        description = "OPEN"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = []
        self = true
        }
    ]

    tags = {
        Terraform = "true"
    }
}

resource "aws_instance" "prod_web" {
    ami             = "ami-0ed34781dc2ec3964"
    instance_type   = "t2.nano"

    vpc_security_group_ids = [
        aws_security_group.prod_web.id
    ]

    tags = {
        Terraform = "true"
    }
}

resource "aws_eip" "prod_web" {
    instance = aws_instance.prod_web.id

    tags = {
        Terraform = "true"
    }
}