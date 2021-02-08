global_settings = {
  default_region = "region1"
  regions = {
    region1 = "southeastasia"
  }
}

resource_groups = {
  lb = {
    name = "example-lb"
  }
}


public_ip_addresses = {
  lb_pip = {
    name               = "lb_pip1"
    resource_group_key = "lb"
    sku                = "Basic"
    # Note: For UltraPerformance ExpressRoute Virtual Network gateway, the associated Public IP needs to be sku "Basic" not "Standard"
    allocation_method = "Dynamic"
    # allocation method needs to be Dynamic
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
}

load_balancers = {
  lb1 = {
    name="lb-test"
    sku = "basic"
    resource_group_key = "lb"

    backend_address_pool = {
      pool1 = {
        backend_address_pool_name = "web-app"
      }
    }

    frontend_ip_configuration = {
     config1 = {
       name= "config1"
       public_ip_address_key = "lb_pip"
      }
     } 

    probe ={
      probe1 = {
       resource_group_key = "lb"
       load_balancer_key  = "lb1"
       probe_name         = "probe1"
       port               = "22"
      }
    }

    lb_rules = {
      rule1 = {
        resource_group_key = "lb"
        load_balancer_key = "lb1"
        lb_rule_name = "rule1"
        protocol = "tcp"
        frontend_port = "3389"
        backend_port = "3389"
        frontend_ip_configuration_name = "config1"  #name must match the configuration that's defined in the load_balancers block.
      }
    }

    outbound_rule = {
      rule1 ={
        name = "outbound-rule"
        protocol = "All"
        frontend_ip_configuration = {
          config1 = {
            name = "config1"
          }
        }
      }
    }
  }
}



