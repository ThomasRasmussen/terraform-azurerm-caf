global_settings = {
  default_region = "region1"
  regions = {
    region1 = "southeastasia"
  }
}
resource_groups = {
  rg1 = {
    name   = "dedicated-test"
    region = "region1"
  }
}

kusto_clusters = {
  kc1 = {
    name               = "kustocluster"
    resource_group_key = "rg1"
    region             = "region1"

    sku = {
      name     = "Dev(No SLA)_Standard_E2a_v4"
      capacity = 1
    }
  }
}
kusto_databases = {
  kdb1 = {
    name               = "kdb1"
    resource_group_key = "rg1"
    region             = "region1"
    cluster_key        = "kc1"
    #hot_cache_period   = "P7D"
    #soft_delete_period = "P31D"
  }
}
