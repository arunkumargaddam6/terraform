resource "aws_vpc" "default" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags = {
    Name = "anand-vpc"
  }
}
output "vpc_id12" {
value = "aws_vpc.default.id"
  
}