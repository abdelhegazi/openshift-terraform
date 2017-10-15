 
 # VPC1 cassandra cluster instances 
 resource "aws_instance" "cassandra_cluster_instances" {
  count                  = "${var.mode_cassandra_cluster_instances_count}"
  ami                    = "${var.mod_ami}"
  instance_type          = "${var.mod_cassandra_node_instance_type}"
  availability_zone      = "${element(split(",", var.mod_avz), count.index)}"
  key_name               = "${var.mod_cassandra_key_name}"
  vpc_security_group_ids = ["${aws_security_group.vpc1_cassandra_sg.id}"]
  subnet_id              = "${element(split(",", var.mode_vpc1_pubsn_ids), count.index)}"
  monitoring             = true
  associate_public_ip_address = true

  user_data = <<-EOF
        #!/bin/bash
        sudo yum -y update
      	sudo yum -y install epel-release
      	sudo yum -y install curl git make unzip vim ansible
      	EOF
  tags {
    Name           = "ahegazi_openshift_cluster101_${count.index}"
    ansible_filter = "ansible_openshift_cluster101_${count.index}"
  }
}

# VPC1 Cassandra Security Group
resource "aws_security_group" "vpc1_cassandra_sg" {
  vpc_id      = "${var.mod_vpc1_id}"
  name        = "${var.mod_vpc1_cassandra_sg_name}"
  description = "allowing ssh and openshift related ports in and no blocking on the outgoing traffic"
  # ssh
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Inter-node cluster / SSL inter-node cluster
  /* Required for DNS resolution of cluster services (SkyDNS). Installations prior 
  # to 3.2 or environments upgraded to 3.2 use port 53. New installations will use 
  # 8053 by default so that dnsmasq may be configured. */
  ingress {
    from_port   = 53
    to_port     = 53
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8053
    to_port     = 8053
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8053
    to_port     = 8053
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
# Required for SDN communication between pods on separate hosts.
  ingress {
    from_port   = 4789
    to_port     = 4789
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 4789
    to_port     = 4789
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  /* Required for node hosts to communicate to the master API, 
  # for the node hosts to post back status, to receive tasks, and so on */
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #The master proxies to node hosts via the Kubelet for oc commands.
  ingress {
    from_port   = 10250
    to_port     = 10250
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 2379
    to_port     = 2380
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 2379
    to_port     = 2380
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 4001
    to_port     = 4001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 4001
    to_port     = 4001
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 1936
    to_port     = 1936
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9200
    to_port     = 9200
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9300
    to_port     = 9300
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # ping
  ingress {
    from_port       = -1
    to_port         = -1
    protocol        = "icmp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name           = "ahegazi_cassandra_cluster101_vpc1_sg1"
    ansible_filter = "ansible_cassandra_cluster101_vpc1"
  }
}