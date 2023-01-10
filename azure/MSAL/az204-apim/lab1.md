# Exercise: Create a backend API

## Procedure

Using Azure cloud shell with bash

1. Environment Variables

```
resourceGroupName=az204-apim-rg
myApiName=az204-apim-$RANDOM
myLocation=<myLocation>
myEmail=<myEmail>
```

2. Create Resource Group

```
az group create --name $resourceGroupName --location $myLocation
```

3. Create APIM instance

```
az apim create -n $myApiName \
    --location $myLocation \
    --publisher-emial $myEmail \
    --resource-group $resourceGroupName \
    --publisher-name AZ204-APIM-Exercise \
    --sku-name Consumption
```

4. Import a backend API

5. Configure the backend settings

6. Verify

## Clean up

```
az group delete --name $resourceGroupName --no-wait
```


## Reference
https://learn.microsoft.com/en-us/training/modules/explore-api-management/8-import-api