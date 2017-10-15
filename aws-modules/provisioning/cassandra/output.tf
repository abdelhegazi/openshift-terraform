// VPC1
output "vpc1_id" {
    value = "${aws_vpc.cassandra_cluster101_vpc1.id}"
}

// VPC1 IGW
output "vpc1_igw_id" {
    value = "${aws_internet_gateway.cassandra_vpc1_igw.id}"
}

// VPC1 public routing table
output "pubrt_id" {
    value = "${aws_route_table.cassandra_vpc1_pubrt.id}"
}

// VPC1 Public subnets
output "vpc1_pubsn_ids" {
    value = "${join(",", aws_subnet.cassandra_vpc1_pubsn.*.id)}"
}

// VPC cassandra security group
output "vpc1_cassandra_sg" {
    value = "${aws_security_group.vpc1_cassandra_sg.id}"
}

// Nodes Properties
output "cassandra_cluster_instances_instances_ids" {
    value = "${split(",", aws_instance.cassandra_cluster_instances.*.id)}"
}

output "cassandra_cluster_instances_private_ips" {
    value = "${join(",", aws_instance.cassandra_cluster_instances.*.private_ip)}"
}

output "cassandra_cluster_instances_public_ips" {
    value = "${join(",", aws_instance.cassandra_cluster_instances.*.public_ip)}"
}
output "cassandra_cluster_instances_security_groups" {
    value = "${join(",", aws_instance.cassandra_cluster_instances.*.security_groups)}"
}