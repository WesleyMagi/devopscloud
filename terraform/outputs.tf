output "eks_cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "rds_endpoint" {
  value = aws_db_instance.rds.endpoint
}