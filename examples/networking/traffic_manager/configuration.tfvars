global_settings = {
  default_region = "region1"
  regions = {
    region1 = "southeastasia"
  }
}

resource_groups = {
  traffic_manager = {
    name = "trafficmanagervk"
  }
}

traffic_manager_profile = {
  parent = {
    name =  "trafficmanagervk"
    resource_group_key = "traffic_manager"
    profile_status = "Disabled"
    traffic_view_enabled = "false"
    max_return = "3"    
    dns_config = {
       relative_name = "trafficmanagervk"
       ttl = "90"
    }
    monitor_config = {
       protocol                     = "HTTPS"
       port                         = 443
       path                         = "/"
       interval_in_seconds          = 30
       timeout_in_seconds           = 8
       tolerated_number_of_failures = 5
    }

   
    tags = {
       name = "something"
    }
  }
  child = {
    name =  "trafficmanagervks"
    resource_group_key = "traffic_manager"
    profile_status = "Disabled"
    dns_config = {
       relative_name = "trafficmanagervks"
       ttl = "90"
    }
    monitor_config = {
       protocol                     = "HTTP"
       port                         = 80
       path                         = "/"
       interval_in_seconds          = 30
       timeout_in_seconds           = 8
       tolerated_number_of_failures = 5
    }

    tags = {
       name = "something2"
    }
  }
}

traffic_manager_endpoint = {
  example_1 = {
      name                = "test"
      resource_group_key  = "traffic_manager"
      target              = "terraform.io"
      type                = "externalEndpoints"
      endpoint_status     = "Enabled"
      weight              = 100
      traffic_manager_profile = {
        key = "parent"
      }
      custom_header  = {
        name = "test"
        value = "host:contoso.com,customheader:contoso"
      }
  }
  example_2 = {
      name                = "test2"
      resource_group_key  = "traffic_manager"
      target              = "terraforms.io"
      type                = "externalEndpoints"
      endpoint_status     = "Disabled"
      weight              = 100
      traffic_manager_profile = {
        key = "parent"
      }
  }
}
/*
traffic_manager_nested_endpoint = {
   traffic_manager_nested_endpoint_1 = {
     name = "example"
      traffic_manager_profile = {
       #lz_key = ""
       key = "parent"
       
     }
      traffic_manager_profile = {
       #lz_key = ""
       key = "child"
       
     }
   }

}
*/