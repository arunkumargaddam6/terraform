resource "aws_security_group" "web" {
  description = "controls access to the application "

  vpc_id = "${var.vpc_id}"
  name   = "demo-ELB"

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
}
output "websg12"{
  value = "aws_security_group.web.id"
}

resource "aws_instance" "Master" {
  ami                         = "${lookup(var.amis, var.region)}"
  availability_zone           = "ap-southeast-2b"
  instance_type               = "t2.micro"
  key_name                    = "${var.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.web.id}"]
  subnet_id                   = "${aws_subnet.public-subnet-in-us-east.id}"
  associate_public_ip_address = true
  source_dest_check           = false
  user_data                   = "./install_docker_machine_compose.sh"

  tags = {
    Name = "anand-Master"
  }

}
