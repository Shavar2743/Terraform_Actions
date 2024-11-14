provider "aws" {
  region = "eu-central-1"
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_subnet" "default_subnet" {
  vpc_id            = data.aws_vpc.default.id
  cidr_block        = "172.31.0.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "Default Subnet"
  }
}

resource "aws_instance" "Homework" {
  ami           = "ami-0eddb4a4e7d846d6f"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.default_subnet.id

  tags = {
    Name = "Homework-Instance"
  }
}

output "instance_public_ip" {
  value       = aws_instance.Homework.public_ip
  description = "Die öffentliche IP-Adresse der Homework-Instance"
}
