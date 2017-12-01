azure_subscription_id = "a153d3ba-c70b-4417-83f7-6e1166d649db"
azure_tenant_id       = "206e9122-8f33-4f7a-8961-7813e1318c64"
azure_client_id       = "770fc347-3f08-47ea-aee9-e0105ecff118"
azure_client_secret   = "0eacc125-b1a3-434b-b05d-b94bf09d36f3"

resource_group_name = "synax-blog-app-prod"
azure_location = "North Europe"

dns_zone = "synax.io"
dns_zone_resource_group_name = "synax.io"
dns_zone_cname_record_name = "www"

cdn_profile_sku = "Standard_Verizon"
cdn_profile_name = "synax-blog-app-prod-cdn-profile-name"
cdn_endpoint_host_name = "synax-blog-app-prod"
cdn_endpoint_origin_name = "synaxblog"

app_service_plan_name = "synax-blog-app-prod-plan"
app_service_name = "synax-blog-app-prod"

storage_account_name = "synaxblogappprodstorage"
storage_container_name = "synax-blog-app-prod-blob"
storage_account_tier = "Standard"
storage_account_replica_type = "LRS"
storage_container_access_type = "private"