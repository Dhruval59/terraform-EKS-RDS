provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  enable_dns_support   = true 
  enable_dns_hostnames = true
}

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr_block_a
  availability_zone       = var.availability_zone_a
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr_block_b
  availability_zone       = var.availability_zone_b
  map_public_ip_on_launch = true
}

resource "aws_db_subnet_group" "mydb" {
  name        = var.db_subnet_group_name
  subnet_ids  = [aws_subnet.public_a.id, aws_subnet.public_b.id]
  description = var.db_subnet_group_description
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 21.0"
  name    = var.eks_cluster_name
  kubernetes_version = var.eks_cluster_version
  subnet_ids        = [aws_subnet.public_a.id, aws_subnet.public_b.id]
  vpc_id          = aws_vpc.main.id

  eks_managed_node_groups = {
    eks_nodes = {
      desired_capacity = var.node_desired_capacity
      max_capacity     = var.node_max_capacity
      min_capacity     = var.node_min_capacity
      instance_type    = var.node_instance_type
      key_name         = var.key_name
    }
  }
}

resource "aws_db_instance" "mydb" {
  allocated_storage    = var.db_allocated_storage
  storage_type         = var.db_storage_type
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.mydb.name
  publicly_accessible  = var.db_publicly_accessible
  multi_az             = false
  skip_final_snapshot  = true

}
