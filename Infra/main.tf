resource "azurerm_resource_group" "rg" {
  name     = "todo-app-rg"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "my-aks-cluster"
  location            = "westus"  # Change this to another region like westus or centralus
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "myaks"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  private_cluster_enabled = true  # Enables Private Link
  
}

