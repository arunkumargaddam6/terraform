variable "region"{
default = "ap-southeast-2"
}

variable "vpc_cidr"{
    default = "10.0.0.0/16"
}

variable "pub_cidr"{
    default = "10.0.1.0/24"
}

variable "pri_cidr"{
    default = "10.0.2.0/24"
}

variable "avail_zone"{
    default = "ap-southeast-2b"
}