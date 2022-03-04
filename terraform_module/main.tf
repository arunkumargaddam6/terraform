provider "aws" {
  region = "ap-southeast-2"
  shared_credentials_file = "~/.aws/credentials"

}

# Resources


# Modules

#module "vpc" {
  #source = ".//modules/vpc"
  #}
module "alb" {
  source = ".//modules/vpc"
  vpc_cidr = "${modules.vpc_id22}"
  subnet = "${modules.subnet}"
  }
  

