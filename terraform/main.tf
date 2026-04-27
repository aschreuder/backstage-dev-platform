locals {
  service_files = fileset("${path.module}/../infra_requests/services", "*.yaml")

  services = {
    for file in local.service_files :
    trimsuffix(file, ".yaml") => yamldecode(
      file("${path.module}/../infra_requests/services/${file}")
    )
  }

  postgres_services = {
    for name, svc in local.services :
    name => svc
    if try(svc.spec.postgres.enabled, false)
  }
}

module "postgres" {
  for_each = local.postgres_services

  source = "./modules/rds-postgres"

  service_name       = each.value.metadata.name
  owner              = each.value.metadata.owner
  vpc_id             = var.vpc_id
  subnet_ids         = var.subnet_ids
  engine_version     = each.value.spec.postgres.engine_version
  instance_class     = each.value.spec.postgres.instance_class
  allocated_storage  = each.value.spec.postgres.allocated_storage
}