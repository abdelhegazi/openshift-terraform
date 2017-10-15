# VPC1 IGW
resource "aws_internet_gateway" "cassandra_vpc1_igw" {
  vpc_id = "${var.mod_vpc1_id}"

  tags {
    Name           = "ahegazi_openshift_cluster101_vpc1_igw"
    ansible_filter = "ansible_openshift_cluster101_vpc1"
  }
}

