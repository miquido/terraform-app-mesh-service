<!-- markdownlint-disable -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_appmesh_virtual_node.service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appmesh_virtual_node) | resource |
| [aws_appmesh_virtual_service.service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appmesh_virtual_service) | resource |
| [aws_iam_role_policy.ecs_service_task](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_route53_record.service_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_service_discovery_service.service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_service) | resource |
| [aws_iam_policy_document.envoy_proxy_authorization](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_health_check_path"></a> [app\_health\_check\_path](#input\_app\_health\_check\_path) | App health check port | `string` | n/a | yes |
| <a name="input_app_port"></a> [app\_port](#input\_app\_port) | Appmesh port | `string` | n/a | yes |
| <a name="input_appmesh_cloud_map_dns_ttl"></a> [appmesh\_cloud\_map\_dns\_ttl](#input\_appmesh\_cloud\_map\_dns\_ttl) | cloud map dns ttl | `number` | `60` | no |
| <a name="input_appmesh_domain"></a> [appmesh\_domain](#input\_appmesh\_domain) | Appmesh domain | `string` | n/a | yes |
| <a name="input_appmesh_name"></a> [appmesh\_name](#input\_appmesh\_name) | Appmesh name | `string` | n/a | yes |
| <a name="input_appmesh_service_name"></a> [appmesh\_service\_name](#input\_appmesh\_service\_name) | service name in appmesh | `string` | n/a | yes |
| <a name="input_cloud_map_dns"></a> [cloud\_map\_dns](#input\_cloud\_map\_dns) | Cloud map dns | `string` | n/a | yes |
| <a name="input_cloud_map_hosted_zone_id"></a> [cloud\_map\_hosted\_zone\_id](#input\_cloud\_map\_hosted\_zone\_id) | Cloud map hosted zone id | `string` | n/a | yes |
| <a name="input_cloud_map_namespace_name"></a> [cloud\_map\_namespace\_name](#input\_cloud\_map\_namespace\_name) | Cloud map namespace name | `string` | n/a | yes |
| <a name="input_map_id"></a> [map\_id](#input\_map\_id) | cloud map id | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Default tags to apply on all created resources | `map(string)` | `{}` | no |
| <a name="input_task_role_name"></a> [task\_role\_name](#input\_task\_role\_name) | ECS task role name | `string` | n/a | yes |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | Route 53 Cloud map zone id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_appmesh-resource-arn"></a> [appmesh-resource-arn](#output\_appmesh-resource-arn) | n/a |
| <a name="output_aws_service_discovery_service_arn"></a> [aws\_service\_discovery\_service\_arn](#output\_aws\_service\_discovery\_service\_arn) | n/a |
<!-- markdownlint-restore -->
