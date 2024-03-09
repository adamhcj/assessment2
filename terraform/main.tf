provider "aws" {
  region = "ap-southeast-1" # Change this to your AWS region
  access_key = "INSERT YOUR ACCESS KEY HERE"
  secret_key = "INSERT YOUR SECRET KEY HERE"
}

resource "aws_security_group" "app_sg" {
  name        = "app-sg"
  description = "Allow inbound traffic"

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
}

# Get amazon linux 2 image
data "aws_ami" "amazon-linux-2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # This is the AWS account ID for Amazon Linux AMIs
}

resource "aws_instance" "app_instance" {
  ami           = data.aws_ami.amazon-linux-2.id # Amazon Linux 2 AMI ID
  instance_type = "t2.micro" # Adjust based on your needs
  security_groups = [aws_security_group.app_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install git -y
              sudo yum install docker -y
              sudo systemctl start docker
              sudo systemctl enable docker
              sudo usermod -aG docker ec2-user
              sudo mkdir -p /usr/local/lib/docker/cli-plugins/
              sudo curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose
              sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
              mkdir -p /home/ec2-user/assessment2
              cd /home/ec2-user/assessment2
              git clone https://github.com/adamhcj/assessment2.git
              cd assessment2
              sudo docker compose up -d
              EOF


  tags = {
    Name = "AppInstance"
  }
}
