resource "aws_eks_node_group" "this" {
  cluster_name    = module.eks.cluster_name
  node_group_name = "eks-nodes"
  node_role_arn   = aws_iam_role.eks_worker_nodes.arn
  subnet_ids      = [aws_subnet.public_a.id, aws_subnet.public_b.id]
  instance_types  = ["t2.nano"]  # Example, adjust as needed

  scaling_config {
    desired_size = var.node_desired_capacity
    max_size     = var.node_max_capacity
    min_size     = var.node_min_capacity
  }
}

