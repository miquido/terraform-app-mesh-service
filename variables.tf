variable "appmesh_cloud_map_dns_ttl" {
  type        = number
  default     = 60
  description = "cloud map dns ttl"
}

variable "map_id" {
  type        = string
  description = "cloud map id"
}

variable "appmesh_service_name" {
  type        = string
  description = "service name in appmesh"
}

variable "cloud_map_dns" {
  type = string
  description = "Cloud map dns"
}

variable "cloud_map_hosted_zone_id" {
  type = string
  description = "Cloud map hosted zone id"
}

variable "zone_id" {
  type = string
  description = "Route 53 Cloud map zone id"
}

variable "tags" {
  type        = map(string)
  description = "Default tags to apply on all created resources"
  default     = {}
}

variable "appmesh_domain" {
  type = string
  description = "Appmesh domain"
}

variable "appmesh_name" {
  type = string
  description = "Appmesh name"
}

variable "app_port" {
  type = string
  description = "Appmesh port"
}

variable "app_health_check_path" {
  type = string
  description = "App health check port"
}

variable "cloud_map_namespace_name" {
  type = string
  description = "Cloud map namespace name"
}

variable "task_role_name" {
  type = string
  description = "ECS task role name"
}
