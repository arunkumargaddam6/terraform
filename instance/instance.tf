resource "aws_instance" "testinstance" {
  ami           = "ami-0a4e637babb7b0a86"
  instance_type = "t2.micro"
  tags = {
    "Name" = "${var.tags}"
  }
}