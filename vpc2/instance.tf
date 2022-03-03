

resource "aws_instance" "server" {
  ami             = "${var.ami}"
  instance_type   = "${var.instype}"
  subnet_id       = "${aws_subnet.pub.id}"
  security_groups = ["${aws_security_group.sg.id}"]
  key_name        = var.key_name
  tags = {
    Name = "${var.tags}"
  }

}
 