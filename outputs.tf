output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "rds_endpoint" {
  value = aws_db_instance.mydb.endpoint
}

output "rds_instance_id" {
  value = aws_db_instance.mydb.id
}

