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


