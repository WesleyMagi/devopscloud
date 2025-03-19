variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "eu-central-1"
}

# VPC Configuration
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "db_alloted_storage" {
  description = "The allocated storage for the database"
  type        = number
  default     = 20
}

variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "spring-db"
}

variable "db_engine" {
  description = "The database engine"
  type        = string
  default     = "postgres"
}

variable "db_engine_version" {
  description = "The database engine version"
  type        = string
  default     = "8.0"
}

variable "db_instance_class" {
  description = "The database instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_username" {
  description = "The database username"
  type        = string
  default     = "foo"
}

variable "db_password" {
  description = "Database password (use secrets manager in production)"
  type        = string
  sensitive   = true
}

variable "db_parameter_group_name" {
  description = "The database parameter group name"
  type        = string
  default     = "default.mysql8.0"
}

variable "db_skip_final_snapshot" {
  description = "Whether to skip the final snapshot"
  type        = bool
  default     = true
}

# EKS configuration

variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "spring-app-eks-cluster"
}

variable "eks_node_desired_capacity" {
  description = "Desired number of nodes in the EKS node group"
  type        = number
  default     = 2
}

variable "eks_node_min_size" {
  description = "Minimum number of nodes in the EKS node group"
  type        = number
  default     = 1
}

variable "eks_node_max_size" {
  description = "Maximum number of nodes in the EKS node group"
  type        = number
  default     = 3
}