locals {
  service_files = fileset("${path.module}/../backstage/infra_request/services", "*.yaml")

  services = {
    for file in local.service_files :
    trimsuffix(file, ".yaml") => yamldecode(
      file("${path.module}/../backstage/infra_request/services/${file}")
    )
  }

  postgres_services = {
    for name, svc in local.services :
    name => svc
    if try(svc.postgres.enabled, false)
  }
}

module "postgres" {
  for_each = local.postgres_services

  source = "./modules/rds-postgres"

  service_name       = each.value.service_name
  owner              = each.value.owner
  engine_version     = each.value.postgres.engine_version
  instance_class     = each.value.postgres.instance_class
  allocated_storage  = each.value.postgres.allocated_storage
}