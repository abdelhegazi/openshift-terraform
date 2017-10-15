output "cassandra_cluster_nodes_public_IPs" {
  value = "${split(",", module.cassandra.cassandra_cluster_instances_public_ips)}"
}

output "cassandra_cluster_nodes_private_IPs" {
  value = "${split(",", module.cassandra.cassandra_cluster_instances_private_ips)}"
}
