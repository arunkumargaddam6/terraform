provider "aws" {
shared_credentials_file = "~/.aws/credentials"
region = "ap-southeast-2"
}

module "instance"{
    source = ".//modules/instance"
}
module "gateway" {
    source = ".//modules/gateway"
    vpc_id = "${module.instance.trp}"
    
}