
resource "null_resource" "set_http_settings" {
  depends_on = [null_resource.set_backend_pools]

  for_each = try(var.settings.http_settings, {})

  triggers = {
    http_settings = jsonencode(each.value)
  }

  provisioner "local-exec" {
    command     = format("%s/scripts/set_resource.sh", path.module)
    interpreter = ["/bin/bash"]
    on_failure  = fail

    environment = {
      RESOURCE                    = "HTTPSETTINGS"
      RG_NAME                     = var.application_gateway.resource_group_name
      APPLICATION_GATEWAY_NAME    = var.application_gateway.name
      NAME                        = each.value.name
      PORT                        = var.application_gateway.frontend_ports[each.value.front_end_port_key].port
      PROTOCOL                    = try(var.application_gateway.frontend_ports[each.value.front_end_port_key].protocol, null)
      COOKIE_BASED_AFFINITY       = try(each.value.cookie_based_affinity, null)
      TIMEOUT                     = try(each.value.timeout, null)
      AFFINITY_COOKIE_NAME        = try(each.value.affinity_cookie_name, null)
      AUTH_CERTS                  = try(each.value.auth_certs, null)
      CONNECTION_DRAINING_TIMEOUT = try(each.value.connection_draining_timeout, null)
      ENABLE_PROBE                = try(each.value.enable_probe, null)
      HOST_NAME                   = try(each.value.host_name, null)
      HOST_NAME_FROM_BACKEND_POOL = try(each.value.host_name_from_backend_pool, null)
      PATH                        = try(each.value.path, null)
      PROBE                       = try(each.value.probe, null)
      ROOT_CERTS                  = try(each.value.root_certs, null) //TODO
    }
  }
}

resource "null_resource" "delete_http_settings" {
  depends_on = [null_resource.delete_backend_pool]

  for_each = try(var.settings.http_settings, {})

  triggers = {
    http_settings_name       = each.value.name
    resource_group_name      = var.application_gateway.resource_group_name
    application_gateway_name = var.application_gateway.name
  }

  provisioner "local-exec" {
    command     = format("%s/scripts/delete_resource.sh", path.module)
    when        = destroy
    interpreter = ["/bin/bash"]
    on_failure  = fail

    environment = {
      RESOURCE                 = "HTTPSETTINGS"
      NAME                     = self.triggers.http_settings_name
      RG_NAME                  = self.triggers.resource_group_name
      APPLICATION_GATEWAY_NAME = self.triggers.application_gateway_name
    }
  }
}