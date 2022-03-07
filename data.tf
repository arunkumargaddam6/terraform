

  data "aws_vpc" "temp2"{
     default = true
 }

 output "trp"{
     value = data.aws_vpc.temp2.id
      }