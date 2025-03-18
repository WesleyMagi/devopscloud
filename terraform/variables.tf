variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "eu-central-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
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
  description = "The database password"
  type        = string
  default     = "foobar"
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