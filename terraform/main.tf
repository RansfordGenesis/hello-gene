resource "aws_key_pair" "deployer-key" {
    key_name   = "deployer-key"
    public_key = file("${pathexpand("~/.ssh/deployer-key.pub")}")
}

resource "aws_security_group" "hello_sg" {
    name_prefix = "hello-gene-sg"

    ingress {
        from_port = 8000
        to_port   = 8000
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port   = 22
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "hello_ec2" {
    ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI
    instance_type = "t2.micro" 
    key_name      = aws_key_pair.deployer-key.key_name
    vpc_security_group_ids = [aws_security_group.hello_sg.id]

    # user_data = <<-EOF
    #             #!/bin/bash
    #             yum update -y
    #             yum install -y docker
    #             service docker start
    #             usermod -a -G docker ec2-user
    #             docker run -d -p 8000:8000 ransfordgenesis/hello-gene:latest
    #             EOF

    tags = {
        Name = "Hello-Gene-Instance"
    }
}