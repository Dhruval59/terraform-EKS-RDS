# VPC and Subnet details
vpc_cidr_block          = "10.0.0.0/16"
subnet_cidr_block_a     = "10.0.1.0/24"  # CIDR block for AZ 1
subnet_cidr_block_b     = "10.0.2.0/24"  # CIDR block for AZ 2
availability_zone_a     = "us-east-1a"    # AZ 1
availability_zone_b     = "us-east-1b"    # AZ 2

# RDS DB Subnet Group
db_subnet_group_name    = "mydb-subnet-group"
db_subnet_group_description = "My DB Subnet Group"

# EKS Cluster Configuration
eks_cluster_name        = "my-eks-cluster"
eks_cluster_version     = "1.30"
node_desired_capacity   = 2
node_max_capacity       = 3
node_min_capacity       = 1
node_instance_type      = "t3.medium"
key_name                = "key"

# RDS Configuration
db_allocated_storage    = 20
db_storage_type         = "gp2"
db_engine               = "mysql"
db_engine_version       = "8.0"
db_instance_class       = "db.t3.micro"
db_username             = "admin"
db_password             = "#####"
db_publicly_accessible  = true
