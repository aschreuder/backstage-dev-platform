locals {
  name = "${var.service_name}-postgres"

  common_tags = merge(
    var.tags,
    {
      Service   = var.service_name
      Owner     = var.owner
      ManagedBy = "terraform"
    }
  )
}

resource "random_password" "db_password" {
  length           = 24
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_secretsmanager_secret" "db_credentials" {
  name        = "${local.name}-credentials"
  description = "Postgres credentials for ${var.service_name}"

  tags = local.common_tags
}

resource "aws_secretsmanager_secret_version" "db_credentials" {
  secret_id = aws_secretsmanager_secret.db_credentials.id

  secret_string = jsonencode({
    username = var.db_username
    password = random_password.db_password.result
    database = var.database_name != null ? var.database_name : replace(var.service_name, "-", "_")
    engine   = "postgres"
  })
}

resource "aws_db_subnet_group" "this" {
  name       = "${local.name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = local.common_tags
}

resource "aws_security_group" "this" {
  name        = "${local.name}-sg"
  description = "Security group for ${local.name}"
  vpc_id      = var.vpc_id

  tags = local.common_tags
}

resource "aws_security_group_rule" "ingress" {
  count = length(var.allowed_security_group_ids)

  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  security_group_id        = aws_security_group.this.id
  source_security_group_id = var.allowed_security_group_ids[count.index]
  description              = "Allow PostgreSQL access"
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.this.id
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow outbound traffic"
}

resource "aws_db_instance" "this" {
  identifier = local.name

  engine         = "postgres"
  engine_version = var.engine_version
  instance_class = var.instance_class

  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  storage_type          = var.storage_type
  storage_encrypted     = true

  db_name  = var.database_name != null ? var.database_name : replace(var.service_name, "-", "_")
  username = var.db_username
  password = random_password.db_password.result

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.this.id]

  publicly_accessible    = var.publicly_accessible
  multi_az               = var.multi_az
  backup_retention_period = var.backup_retention_period
  deletion_protection    = var.deletion_protection
  skip_final_snapshot    = var.skip_final_snapshot

  tags = local.common_tags
}