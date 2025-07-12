variable "region" {
  default = "ap-south-1"
}

variable "app_name" {
  default = "medusa"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "ecr_repo_name" {
  description = "Name of the ECR repository to create"
  type        = string
  default     = "medusa"
}