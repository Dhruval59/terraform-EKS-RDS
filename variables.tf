variable "region" {
  description = "AWS region to deploy the infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block_a" {
  description = "CIDR block for the first public subnet in AZ A"
  type        = string
}

variable "subnet_cidr_block_b" {
  description = "CIDR block for the second public subnet in AZ B"
  type        = string
}

variable "availability_zone_a" {
  description = "The first availability zone"
  type        = string
}

variable "availability_zone_b" {
  description = "The second availability zone"
  type        = string
}

variable "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
  default     = "mydb-subnet-group"
}

variable "db_subnet_group_description" {
  description = "Description of the DB subnet group"
  type        = string
  default     = "My DB subnet group"
}

variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "my-eks-cluster"
}

variable "eks_cluster_version" {
  description = "EKS cluster version"
  type        = string
  default     = "1.30"
}

variable "node_desired_capacity" {
  description = "Desired capacity for EKS node group"
  type        = number
  default     = 2
}

variable "node_max_capacity" {
  description = "Maximum capacity for EKS node group"
  type        = number
  default     = 3
}

variable "node_min_capacity" {
  description = "Minimum capacity for EKS node group"
  type        = number
  default     = 1
}

variable "node_instance_type" {
  description = "Instance type for EKS worker nodes"
  type        = string
  default     = "t3.medium"
}

variable "key_name" {
  description = "EC2 Key pair for EKS worker nodes"
  type        = string
  default     = "my-key-pair"  # Replace with your actual key pair name
}

variable "db_allocated_storage" {
  description = "Allocated storage for RDS instance (in GB)"
  type        = number
  default     = 20
}

variable "db_storage_type" {
  description = "Storage type for the RDS instance"
  type        = string
  default     = "gp2"
}

variable "db_engine" {
  description = "Engine for the RDS instance"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "Version of the RDS engine"
  type        = string
  default     = "8.0"
}

variable "db_instance_class" {
  description = "Instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}


variable "db_username" {
  description = "Username for the RDS database"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Password for the RDS database"
  type        = string
  default     = "password"  # Replace with a strong password
}

variable "db_publicly_accessible" {
  description = "Whether the RDS instance should be publicly accessible"
  type        = bool
  default     = true
}

