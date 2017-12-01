variable "azure_subscription_id" {
  description = "Azure Subscription ID"
}

variable "azure_client_id" {
  description = "Azure Client ID"
}

variable "azure_client_secret" {
  description = "Azure Client Secret"
}

variable "azure_tenant_id" {
  description = "Azure Tenant ID"
}

variable "azure_location" {
  description = "Azure Location, e.g. North Europe"
}

variable "resource_group_name" {
  description = "Azure Resource Group Name"
}

variable "dns_zone" {
  description = "the name of the dns zone to be used"
}

variable "dns_zone_cname_record_name" {
  description = "the name of the record name"
}

variable "dns_zone_resource_group_name" {
  description = "the name of the dns zone resource group to be used"
}

variable "app_service_plan_name" {
  description = "The name of the app service plan"
}

variable "app_service_name" {
  description = "The name of the app service"
}

variable "cdn_profile_sku" {
  description = "The name of the cdn sku"
 }
variable "cdn_profile_name" {
  description = "The name of the cdn profile"
}

variable "cdn_endpoint_host_name" {
  description = "The name of the cdn endpoint name"
}

variable "cdn_endpoint_origin_name" {
  description = "The name of the cdn origin endpoint name"
}

variable "storage_account_name" {
  description = "The name of storage account"
}

variable "storage_account_tier" {
  description = "The storage account tier"
}

variable "storage_account_replica_type" {
  description = "The storage account replica type"
}

variable "storage_container_access_type" {
  description = "The storage account access type"
}

variable "storage_container_name" {
  description = "The name of storage container"
}



