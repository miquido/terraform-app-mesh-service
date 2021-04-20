output "appmesh-resource-arn" {
  value = aws_appmesh_virtual_node.service.arn
}

output "aws_service_discovery_service_arn" {
  value = aws_service_discovery_service.service.arn
}
