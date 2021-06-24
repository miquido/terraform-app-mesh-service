locals {
  appmesh_service_dns = "${var.appmesh_service_name}.${var.appmesh_domain}"
}

resource "aws_service_discovery_service" "service" {
  name = var.appmesh_service_name
  tags = var.tags

  dns_config {
    namespace_id = var.map_id

    dns_records {
      ttl  = var.appmesh_cloud_map_dns_ttl
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  health_check_custom_config {
    failure_threshold = 1
  }
}

resource "aws_route53_record" "service_alias" {
  zone_id = var.zone_id
  name    = var.appmesh_service_name
  type    = "A"

  alias {
    name                   = var.cloud_map_dns
    zone_id                = var.cloud_map_hosted_zone_id
    evaluate_target_health = false
  }
}

# VIRTUAL SERVICES
resource "aws_appmesh_virtual_service" "service" {
  name      = local.appmesh_service_dns
  mesh_name = var.appmesh_name
  tags      = var.tags
  spec {
    provider {
      virtual_node {
        virtual_node_name = aws_appmesh_virtual_node.service.name
      }
    }
  }
}

# VIRTUAL NODES
resource "aws_appmesh_virtual_node" "service" {
  name      = "${var.appmesh_service_name}-virtual-node"
  mesh_name = var.appmesh_name
  tags      = var.tags

  spec {
    listener {
      port_mapping {
        port     = var.app_port
        protocol = "http"
      }

      dynamic "health_check" {
        for_each = var.app_health_check_path != null ? [var.app_health_check_path] : []
        content {
          protocol            = "http"
          port                = var.app_port
          path                = var.app_health_check_path
          healthy_threshold   = 2
          unhealthy_threshold = 2
          timeout_millis      = 2000
          interval_millis     = 5000
        }
      }

      outlier_detection {
        base_ejection_duration {
          unit  = "s"
          value = 90
        }
        interval {
          unit  = "s"
          value = 15
        }
        max_ejection_percent = 100
        max_server_errors    = 10
      }

      timeout {
        http {
          idle {
            unit  = "s"
            value = 90
          }
          per_request {
            unit  = "s"
            value = 60
          }
        }
      }
    }

    service_discovery {
      aws_cloud_map {
        service_name   = var.appmesh_service_name
        namespace_name = var.cloud_map_namespace_name // aws_service_discovery_private_dns_namespace.map.name
      }
    }

    logging {
      access_log {
        file {
          path = "/dev/stdout"
        }
      }
    }
  }
}

# ECS TASK PERMISSIONS
data "aws_iam_policy_document" "envoy_proxy_authorization" {
  statement {
    sid = "EnvoyProxyauthorization"

    effect = "Allow"

    actions = [
      "appmesh:StreamAggregatedResources",
    ]

    resources = [
      aws_appmesh_virtual_node.service.arn,
    ]
  }
}

resource "aws_iam_role_policy" "ecs_service_task" {
  role   = var.task_role_name
  policy = data.aws_iam_policy_document.envoy_proxy_authorization.json
}
