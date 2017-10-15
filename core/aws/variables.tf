
variable "tf_vpc1_cidr_block" {
  default = "172.20.0.0/16"
}

variable "tf_avz" {
    description = "Run EC2 instances in these availability zones"
#    type       = "list"
#    default    = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
    default     = "eu-west-1a,eu-west-1b,eu-west-1c"
}

variable "tf_public_cidr_block" {
    description = "list of public subnet cidr blocks"
#    type	= "list"
    default     = "172.20.101.0/24,172.20.102.0/24,172.20.103.0/24,172.20.104.0/24"
}

variable "tf_public_subnets_count" {
    default 	= 1
}

variable "tf_aws_instance_type" {
  #default 	= "t2.medium"
  default   = "c3.large"
}

variable "tf_ami" {
  #default 	= "ami-7abd0209" /* Centos 7 */
  default = "ami-061b1560"   /* centos 7 */
}

variable "tf_cluster_instances_count" {
  default 	= 1
}

variable "tf_aws_cassandra_key_name" {
  default 	= "ahegazi-cassandra"
}

variable "tf_vpc1_cassandra_sg_name" {
  default = "openshift_cluster_sg"
}

#variable "tf_aws_ovpn_key_name" {
#    default 	= "ahegazi-ovpn"
#}


#variable "tf_openvpn_instances_count" {
#    default     = 1
#}

#variable "tf_private_subnets_count" {
#    default 	= 3
#}

#variable "tf_private_cidr_block" {
#    description = "list of private subnet cidr blocks"
##    type       = "list"
##    default    = ["172.20.1.0/24", "172.20.2.0/24", "172.20.3.0/24"]
#    default     = "172.20.1.0/24,172.20.2.0/24,172.20.3.0/24"
#}
