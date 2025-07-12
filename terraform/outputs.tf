output "cluster_name" {
    value = aws_ecs_cluster.main.name
}

output "ecr_repo_url" {
    value = aws_ecr_repository.medusa.repository_url
}