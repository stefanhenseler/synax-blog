terraform {
    backend "azurerm" {
        key                  = "synax.blog.prod.terraform.tfstate"
    }
}

provider "azurerm" {
  subscription_id = "${var.azure_subscription_id}"
  client_id       = "${var.azure_client_id}"
  client_secret   = "${var.azure_client_secret}"
  tenant_id       = "${var.azure_tenant_id}"
}

resource "azurerm_dns_cname_record" "default" {
  name                = "${var.dns_zone_cname_record_name}"
  zone_name           = "${var.dns_zone}"
  resource_group_name = "${var.dns_zone_resource_group_name}"
  ttl                 = 300
  record              = "${var.cdn_endpoint_host_name}.azureedge.net"
}

# Azure Resource Group
resource "azurerm_resource_group" "default" {
  name     = "${var.resource_group_name}"
  location = "${var.azure_location}"
  depends_on = ["azurerm_dns_cname_record.default"]
}

# resource "azurerm_app_service_plan" "default" {
#  name                = "${var.app_service_plan_name}"
#  location            = "${var.azure_location}"
#  resource_group_name = "${var.resource_group_name}"

#  sku {
#    tier = "Free"
#    size = "F1"
#  }

#  depends_on = ["azurerm_resource_group.default"]
#}

#resource "azurerm_app_service" "default" {
#  name                = "${var.app_service_name}"
#  location            = "${var.azure_location}"
#  resource_group_name = "${var.resource_group_name}"
#  app_service_plan_id = "${azurerm_app_service_plan.default.id}"

#  depends_on = ["azurerm_app_service_plan.default"]
#}

resource "azurerm_storage_account" "default" {
  name                     = "${var.storage_account_name}"
  location                 = "${var.azure_location}"
  resource_group_name      = "${var.resource_group_name}"
  account_tier             = "${var.storage_account_tier}"
  account_replication_type = "${var.storage_account_replica_type}"
  depends_on = ["azurerm_resource_group.default"]
}

resource "azurerm_storage_container" "default" {
  name                  = "${var.storage_container_name}"
  resource_group_name   = "${var.resource_group_name}"
  storage_account_name  = "${azurerm_storage_account.default.name}"
  container_access_type = "${var.storage_container_access_type}"
  depends_on = ["azurerm_storage_account.default"]
}

resource "azurerm_cdn_profile" "default" {
  name                = "${var.cdn_profile_name}"
  location            = "${var.azure_location}"
  resource_group_name = "${var.resource_group_name}"
  sku                 = "${var.cdn_profile_sku}"
  depends_on = ["azurerm_storage_container.default"]
}

resource "azurerm_cdn_endpoint" "default" {
  name                = "${var.cdn_endpoint_host_name}"
  profile_name        = "${var.cdn_profile_name}"
  location            = "${var.azure_location}"
  resource_group_name = "${var.resource_group_name}"

  origin {
    name      = "${var.cdn_endpoint_origin_name}"
    host_name = "${var.app_service_name}.azurewebsites.net"
  }

  depends_on = ["azurerm_cdn_profile.default"]
}