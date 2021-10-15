module "servicebus_topics" {
  source = "./modules/servicebus/topic"
  for_each = local.servicebus.servicebus_topics

  global_settings   = local.global_settings
  client_config     = local.client_config
  settings          = each.value

  remote_objects    = {
    resource_groups       = local.combined_objects_resource_groups
    servicebus_namespaces = local.combined_objects_servicebus_namespaces
  }

}

output "servicebus_topics" {
  value = module.servicebus_topics
}