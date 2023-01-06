# Exercise: Deploy a container instance by using the Azure CLI

##

using azure cloud shell with bash

```
RESOURCE_GROUP_NAME=az204-aci-rg
LOCATION=southeastasia
```

```
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION
```

```
DNS_NAME_LABEL=aci-example-$RANDOM
CONTAINER_NAME=mycontainer
```

```
az container create --resource-group $RESOURCE_GROUP_NAME \
    --name $CONTAINER_NAME \
    --image mcr.microsoft.com/azuredocs/aci-helloworld \
    --ports 80 \
    --dns-name-label $DNS_NAME_LABEL \
    --location $LOCATION 
```

```
az container show --resource-group $RESOURCE_GROUP_NAME \
    --name $CONTAINER_NAME \
    --query "{FQDN:ipAddress.fqdn,ProvisioningState:provisioningState}" \
    --out table
```

```
az group delete --name $RESOURCE_GROUP_NAME --no-wait
```

## Reference

https://learn.microsoft.com/en-us/training/modules/create-run-container-images-azure-container-instances/3-run-azure-container-instances-cloud-shell