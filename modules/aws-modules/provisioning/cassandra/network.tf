// VPC1 Public Routing Table
resource "aws_route_table" "cassandra_vpc1_pubrt" {
  vpc_id = "${var.mod_vpc1_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.cassandra_vpc1_igw.id}"
  }

  tags {
    Name           = "ahegazi_openshift_cluster101_vpc1_pubrt"
    ansible_filter = "ansible_openshift_cluster101_vpc1"
  }
}

// VPC1 public subnet
resource "aws_subnet" "cassandra_vpc1_pubsn" {
  count             = "${var.mod_vpc1_pubsn_count}"
  vpc_id            = "${var.mod_vpc1_id}"
  cidr_block        = "${element(split(",", var.mod_vpc1_public_cidr_block), count.index)}"
  availability_zone = "${element(split(",", var.mod_avz), count.index)}"

  tags {
    Name           = "ahegazi_openshift_cluster101_vpc1_pubsn_${element(split(",", var.mod_avz), count.index)}"
    ansible_filter = "ansible_openshift_cluster101_vpc1_pubsn_${element(split(",", var.mod_avz), count.index)}"
  }
}

## VPC1 /* Public subnets association with the RT */#
resource "aws_route_table_association" "cassandra_vpc1_pubsn_routing" {
  count          = "${var.mod_vpc1_pubsn_count}"
  subnet_id      = "${element(aws_subnet.cassandra_vpc1_pubsn.*.id, count.index)}"
  route_table_id = "${aws_route_table.cassandra_vpc1_pubrt.id}"
}
