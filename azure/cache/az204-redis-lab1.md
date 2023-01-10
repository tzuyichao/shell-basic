# Exercise: Connect an app to Azure Cache for Redis by using .NET Core

## Procedure for Azure Cache for Redis

Open Azure Cloud shell with bash

1. Environment variables

```
myLocation=southeastasia
resourceGroupName=az204-redis-rg
redisName=az204redis$RANDOM
```

2. Create Azure Cache for Redis

```
az group create --resource-group $resourceGroupName --location $myLocation
```

```
az redis create --location $myLocation \
    --resource-group $resourceGroupName \
    --name $redisName \
    --sku Basic \
    --vm-size c0
```

3. List keys

```
az redis list-keys --name $redisName --resource-group $resourceGroupName
```

## C# Client Project



## Clean up

```
az group delete --name $resourceGroupName --no-wait
```

## Reference

1. https://learn.microsoft.com/en-us/training/modules/develop-for-azure-cache-for-redis/5-console-app-azure-cache-redis

2. https://learn.microsoft.com/en-us/cli/azure/redis?view=azure-cli-latest
