# Exercise: Send and receive message from a Service Bus queue by using .NET.

## Procedure

Azure Cloud Shell with bash

1. Environment variables

```
myLocation=southeastasia
myNamespaceName=az204svcbus$RANDOM
```

2. Create resource group

```
az group create --name az204-svcbus-rg --location $myLocation
```

3. Create a Service Bus messaging namespace.

```
az servicebus namespace create \
    --resource-group az204-svcbus-rg \
    --name $myNamespaceName \
    --location $myLocation
```

4. Create a Service Bus queue

```
az servicebus queue create --resource-group az204-svcbus-rg \
    --namespace-name $myNamespaceName \
    --name az204-queue
```

5. Retrieve the connection string for the Service Bus Namespace

6. Console sender app

7. Console receive app

8. Using Azure Portal to navigate service bus queue overview


## Reference

https://learn.microsoft.com/en-us/training/modules/discover-azure-message-queue/6-send-receive-messages-service-bus