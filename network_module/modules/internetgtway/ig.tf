resource "aws_internet_gateway" "default" {
  vpc_id = "${var.vpc_id}"

  tags = {
    Name = "anand-gw"
  }
}
output "ig1" {
  value = "${aws_internet_gateway.default.id}"
  
}
