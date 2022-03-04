provider "aws" {
  region = "ap-southeast-2"
  shared_credentials_file = "~/.aws/credentials"

}

#modules

module "internetgtway" {
  source = ".//modules/internetgtway"
  vpc_id = "${module.vpcid.vpc_id12}"
}
module "routetable" {
  source = ".//modules/routetable"
  vpc_id = "module.vpcid.vpc_id12"
 gateway_id = "${module.internetgtway.ig1}"
}
module "securitygrp" {
  source = ".//modules/securitygrp"
  vpc_id = "${module.vpcid.vpc_id12}"
}
module "subnet" {
  source = ".//modules/subnet"
  vpc_id = "${module.vpcid.vpc_id12}"
}
module "vpcid" {
  source = ".//modules/vpcid"
}


