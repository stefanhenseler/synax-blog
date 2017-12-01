# synax-blog
Contains the source for the synax.io blog.

Setup Backend config:

```
# Add Microsoft.Web provider
az provider register -n Microsoft.Web

# Initialize Storage Backend
terraform init -backend-config=beconf.tfvars
```
