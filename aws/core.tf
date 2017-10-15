provider "aws" { }

module "cassandra" {
  source = "../aws-modules/provisioning/cassandra"
  
  mod_vpc1_cidr_block                     = "${var.tf_vpc1_cidr_block}"
  mod_vpc1_id                             = "${module.cassandra.vpc1_id}"
  mod_vpc1_pubsn_count                    = "${var.tf_public_subnets_count}"
  mod_vpc1_public_cidr_block              = "${var.tf_public_cidr_block}"
  mod_avz                                 = "${var.tf_avz}"
  mode_cassandra_cluster_instances_count  = "${var.tf_cluster_instances_count}"
  mod_ami                                 = "${var.tf_ami}"
  mod_cassandra_node_instance_type        = "${var.tf_aws_instance_type}"
  mod_cassandra_key_name                  = "${var.tf_aws_cassandra_key_name}"
  mod_vpc1_cassandra_sg_name              = "${var.tf_vpc1_cassandra_sg_name}"
  mode_vpc1_pubsn_ids                     = "${module.cassandra.vpc1_pubsn_ids}"
}


#module "ansible-playbooks" {
#  source = "../aws-modules/ansible-playbooks"
#
#}