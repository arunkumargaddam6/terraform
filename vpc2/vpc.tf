provider "aws" {
    region = "${var.region}"
    shared_credentials_file = "~/.aws/credentials"

  
}

resource "aws_vpc" "arun_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  instance_tenancy = "default"

  tags = {
    Name = "demo-vpc"
  }
}

resource "aws_internet_gateway" "arun-gw" {
  vpc_id = aws_vpc.arun_vpc.id

  tags = {
    Name = "arun-gw"
  }
}

resource "aws_subnet" "pub" {
  vpc_id     = aws_vpc.arun_vpc.id
  cidr_block = "${var.pub_cidr}"
  availability_zone = "${var.avail_zone}"

  tags = {
    Name = "public"
  }
}

 resource "aws_subnet" "pri" {
   vpc_id     = aws_vpc.arun_vpc.id
   cidr_block = "${var.pri_cidr}"
   availability_zone = "${var.avail_zone}"

   tags = {
     Name = "private"
   }
 }


 resource "aws_eip" "ip" {
   vpc         = true
 }



 resource "aws_nat_gateway" "name" {
     allocation_id =  aws_eip.ip.id
     subnet_id = aws_subnet.pri.id
  
 tags = {
     Name = "NGW"
    }
 }


resource "aws_route_table" "route1" {
  vpc_id = aws_vpc.arun_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.arun-gw.id
  }
   tags = {
    Name = "public"
  }
}

  resource "aws_route_table" "route2" {
  vpc_id = aws_vpc.arun_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.name.id
  }
   tags = {
    Name = "private"
  }
  
  
}
resource "aws_route_table_association" "assos1" {
  subnet_id      = aws_subnet.pub.id
  route_table_id = aws_route_table.route1.id
}
 resource "aws_route_table_association" "assos2" {
   subnet_id      = aws_subnet.pri.id
   route_table_id = aws_route_table.route2.id
 }

resource "aws_security_group" "sg" {
  name        = "firstsg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.arun_vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.arun_vpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "firstsg"
  }
}