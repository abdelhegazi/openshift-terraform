resource "aws_vpc" "cassandra_cluster101_vpc1" {
  cidr_block           = "${var.mod_vpc1_cidr_block}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name           = "ahegazi_openshift_cluster101"
    ansible_filter = "ansible_openshift_cluster101_vpc1"
  }
}

