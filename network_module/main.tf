provider "aws" {
  region = "ap-southeast-2"
  shared_credentials_file = "~/.aws/credentials"

}

#modules

module "internetgtway" {
  source = ".//internetgtway"
  vpc_id = "module.vpcid.vpc_id12"
}
module "routetable" {
  source = ".//routetable"
  vpc_id = "module.vpcid.vpc_id12"
 gateway_id = "module.internetgtway.ig1"
}
module "securitygrp" {
  source = ".//securitygrp"
  vpc_id = "module.vpcid.vpc_id12"
}
module "subnet" {
  source = ".//subnet"
  vpc_id = "module.vpcid.vpc_id12"
}
module "vpcid" {
  source = ".//vpcid"
}


