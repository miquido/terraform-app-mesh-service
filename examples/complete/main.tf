provider "aws" {
  region = "us-east-1"
}

module "test" {
  source                   = "../../"
  app_health_check_path    = "test/api/health"
  app_port                 = "8080"
  appmesh_domain           = "mesh.example.com"
  appmesh_name             = "test"
  appmesh_service_name     = "test"
  cloud_map_dns            = "test"
  cloud_map_hosted_zone_id = "test"
  cloud_map_namespace_name = "test"
  map_id                   = "test"
  task_role_name           = "example_task"
  zone_id                  = "Z3XAMPL3"
}
