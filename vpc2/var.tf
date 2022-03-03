variable "region" {
  default = "ap-southeast-2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "pub_cidr" {
  default = "10.0.1.0/24"
}

variable "pri_cidr" {
  default = "10.0.2.0/24"
}

variable "avail_zone" {
  default = "ap-southeast-2b"
}
variable "key_name" {
  default = "arun-training"
}
variable "ami"{
    default = "ami-0a4e637babb7b0a86"
}
variable "instype"{
    default = "t2.micro"
}
variable "tags"{
  default = "server1"
}