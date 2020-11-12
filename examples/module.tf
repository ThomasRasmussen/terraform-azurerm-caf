module "caf" {
  source = "../"

  current_landingzone_key     = var.landingzone.key
  tenant_id                   = var.tenant_id
  global_settings             = var.global_settings
  diagnostic_storage_accounts = var.diagnostic_storage_accounts
  logged_user_objectId        = var.logged_user_objectId
  logged_aad_app_objectId     = var.logged_aad_app_objectId
  resource_groups             = var.resource_groups
  storage_accounts            = var.storage_accounts
  azuread_groups              = var.azuread_groups
  keyvaults                   = var.keyvaults
  keyvault_access_policies    = var.keyvault_access_policies
  managed_identities          = var.managed_identities
  role_mapping                = var.role_mapping
  event_hub_namespaces        = var.event_hub_namespaces
  webapp = {
    azurerm_application_insights = var.azurerm_application_insights
    app_service_environments     = var.app_service_environments
    app_service_plans            = var.app_service_plans
    app_services                 = var.app_services
  }
  compute = {
    virtual_machines = var.virtual_machines
    bastion_hosts    = var.bastion_hosts
    aks_clusters     = var.aks_clusters
  }
  networking = {
    vnets                             = var.vnets
    vnet_peerings                     = var.vnet_peerings
    network_security_group_definition = var.network_security_group_definition
    public_ip_addresses               = var.public_ip_addresses
    route_tables                      = var.route_tables
    azurerm_routes                    = var.azurerm_routes
    private_dns                       = var.private_dns
    virtual_wans                      = var.virtual_wans
    application_gateways              = var.application_gateways
    application_gateway_applications  = var.application_gateway_applications
  }
  database = {
    azurerm_redis_caches        = var.azurerm_redis_caches
    mssql_servers               = var.mssql_servers
    mssql_managed_instances     = var.mssql_managed_instances
    mssql_databases             = var.mssql_databases
    mssql_managed_databases     = var.mssql_managed_databases
    mssql_elastic_pools         = var.mssql_elastic_pools
    mssql_failover_groups       = var.mssql_failover_groups
    mssql_mi_failover_groups    = var.mssql_mi_failover_groups
    synapse_workspaces          = var.synapse_workspaces
    databricks_workspaces       = var.databricks_workspaces
    machine_learning_workspaces = var.machine_learning_workspaces
  }
  shared_services = {
    monitoring = var.monitoring
  }
  enable = {}
}
