resource "aws_instance" "testinstance" {
  ami           = "ami-089e8a52c00cede0b"
  instance_type = "t2.micro"
  tags = {
    "Name" = "${var.tags}"
  }
}