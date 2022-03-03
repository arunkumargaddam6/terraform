resource "aws_subnet" "public-subnet-in-us-east" {
  vpc_id = "${aws_vpc.default.id}"

  cidr_block        = "${var.public_subnet_cidr}"
  availability_zone = "ap-southeast-2b"

  tags = {
    Name = "anandPublicsubnet"
  }
}
