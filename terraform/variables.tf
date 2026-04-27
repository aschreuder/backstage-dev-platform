variable "vpc_id" {
  type        = string
  description = "VPC ID where the RDS security group will be created."
}

variable "subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for the DB subnet group."
}