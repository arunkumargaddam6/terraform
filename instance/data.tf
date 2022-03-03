data "aws_instance" "temp" {
  instance_tags = {
      "Name" = "${var.tags}"
  }
}

  output "ppt"{
      value = data.aws_instance.temp
  }

 data "aws_vpc" "temp1"{
     default = true
 }

 output "trp"{
     value = data.aws_vpc.temp1.id
      }