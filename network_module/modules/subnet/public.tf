resource "aws_subnet" "public-subnet-in-us-east" {
  vpc_id = "${var.vpc_id}"

  cidr_block        = "${var.public_subnet_cidr}"
  availability_zone = "ap-southeast-2b"

  tags = {
    Name = "anandPublicsubnet"
  }
}
output "public_subnet" {

    value = "${aws_subnet.public-subnet-in-us-east.id}"  
}
