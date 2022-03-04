variable "aws_region" {
  description = "AWS current region"
  default     = "ap-southeast-2"
}

variable "key_path" {
  description = "Key path for SSHing into EC2"
  default     = "G:\training"
}


variable "region" {
  description = "AWS region for hosting our your network"
  default     = "ap-southeast-2"
}

variable "key_name" {
  description = "Key name for SSHing into EC2"
  default     = "arun-training"
}


variable "private_subnet_cidr" {
  description = "CIDR for private subnet"
  default     = "10.0.2.0/24"
}

variable "amis" {
  description = "Base AMI to launch the instances"
  default = {
    ap-southeast-2 = "ami-0a4e637babb7b0a86"
  }
}
variable "bootstrap_path" {
  description = "Script to install Docker Engine"
  default     = "install_docker_machine_compose.sh"
}
