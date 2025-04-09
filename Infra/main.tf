resource "azurerm_resource_group" "rg" {
  name     = "buddy-wise"
  location = "westus"  
}

resource "azurerm_container_registry" "acr" {
  name                = "acrbuddywise"
  location            = "westus"
  resource_group_name = "buddy-wise"
  sku                 = "Standard"

  admin_enabled                = true
  anonymous_pull_enabled       = false
  data_endpoint_enabled        = false
  export_policy_enabled        = true
  public_network_access_enabled = true
  quarantine_policy_enabled    = false
  trust_policy_enabled         = false
  zone_redundancy_enabled      = false
  network_rule_bypass_option   = "AzureServices"

  tags = {
    environment = "production"
  }
}


resource "azurerm_kubernetes_cluster" "aks" {
  name                = "buddywiseaks"
  location            = "westus"
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "buddywiseaks-dns"
  kubernetes_version  = "1.30.10"
  oidc_issuer_enabled = true

  default_node_pool {
    name                        = "agentpool"
    vm_size                     = "Standard_D4as_v4"
    node_count                  = 2
    min_count                   = 2
    max_count                   = 5
    orchestrator_version        = "1.30.10"
    os_disk_size_gb            = 128
    os_disk_type               = "Managed"
    os_sku                     = "Ubuntu"
    kubelet_disk_type          = "OS"
    type                       = "VirtualMachineScaleSets"
    scale_down_mode            = "Delete"
    auto_scaling_enabled       = true
    
    upgrade_settings {
      max_surge                      = "10%"
      drain_timeout_in_minutes       = 0
      node_soak_duration_in_minutes  = 0
    }
  }

  identity {
    type = "SystemAssigned"
  }

  auto_scaler_profile {
    balance_similar_node_groups                    = false
    daemonset_eviction_for_empty_nodes_enabled     = false
    daemonset_eviction_for_occupied_nodes_enabled  = true
    empty_bulk_delete_max                          = "10"
    expander                                       = "random"
    ignore_daemonsets_utilization_enabled          = false
    max_graceful_termination_sec                   = "600"
    max_node_provisioning_time                     = "15m"
    max_unready_nodes                              = 3
    max_unready_percentage                         = 45
    new_pod_scale_up_delay                         = "0s"
    scale_down_delay_after_add                     = "10m"
    scale_down_delay_after_delete                  = "10s"
    scale_down_delay_after_failure                 = "3m"
    scale_down_unneeded                            = "10m"
    scale_down_unready                             = "20m"
    scale_down_utilization_threshold               = "0.5"
    scan_interval                                  = "10s"
    skip_nodes_with_local_storage                  = false
    skip_nodes_with_system_pods                    = true
  }

  private_cluster_enabled   = false
  azure_policy_enabled      = false
  http_application_routing_enabled = false

  tags = {}
}


