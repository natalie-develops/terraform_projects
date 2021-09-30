#recommendations for well-architected framework - resuable implementation of VPC networking and EC2
#with out VPC you can't launch EC2. Everything is implemented on top of it.

variable "vpc_cidr_block" {}
variable "public_subnet_1_cidr" {}
variable "public_subnet_2_cidr" {}
variable "public_subnet_3_cidr" {}
variable "private_subnet_1_cidr" {}
variable "private_subnet_2_cidr" {}
variable "private_subnet_3_cidr" {}
variable "eip_association_address" {}
variable "ec2_keypair" {}
variable "ec2_instance_type" {}
