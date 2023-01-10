# Exercise: Route custom events to web endpoint by using Azure CLI

## Procedure

1. Environment Varibales

```
let rNum=$RANDOM*$RANDOM
myLocation=<myLocation>
myTopicName="az204-egtopic-${rNum}"
mySiteName="az204-egsite-${rNum}"
mySiteURL="https://${mySiteName}.azurewebsites.net"
resourceGroupName=az204-evgrid-rg
```

2. Create Resrouce Group

```
az group create --name $resourceGroupName --location $myLocation
```

3. Regist Event Grid

```
az provider register --namespace Microsoft.EventGrid
```

check status for provider

```
az provider show --namespace Microsoft.EventGrid --query "registrationState"
```

4. Create a Custom topic

```
az eventgrid topic create --name $myTopicName \
    --location $myLocation \
    --resource-group $resourceGroupName
```

5. Create a message endpoint

```
az deployment group create \
    --resource-group $resourceGroupName \
    --template-uri "https://raw.githubusercontent.com/Azure-Samples/azure-event-grid-viewer/main/azuredeploy.json" \
    --parameters siteName=$mySiteName hostingPlanName=viewerhost

echo "Your web app URL: ${mySiteURL}"
```

6. Subscribe to a custom topic

```
endpoint="${mySiteURL}/api/updates"
subId=$(az account show --subscription "" | jq -r '.id')

az eventgrid event-subscription create \
    --source-resource-id "/subscriptions/$subId/resourceGroups/az204-evgrid-rg/providers/Microsoft.EventGrid/topics/$myTopicName" \
    --name az204ViewerSub \
    --endpoint $endpoint
```

7. Retrieve URL and key for custom topic

```
topicEndpoint=$(az eventgrid topic show --name $myTopicName -g az204-evgrid-rg --query "endpoint" --output tsv)
key=$(az eventgrid topic key list --name $myTopicName -g az204-evgrid-rg --query "key1" --output tsv)
```

8. Create event data to send

```
event='[ {"id": "'"$RANDOM"'", "eventType": "recordInserted", "subject": "myapp/vehicles/motorcycles", "eventTime": "'`date +%Y-%m-%dT%H:%M:%S%z`'", "data":{ "make": "Contoso", "model": "Monster"},"dataVersion": "1.0"} ]'
```

9. use curl to send event to topic

```
curl -X POST -H "aeg-sas-key: $key" -d "$event" $topicEndpoint
```

10. view web app to verify event sent.


## Clean up

```
az group delete --name $resourceGroupName --no-wait
```

## Reference

https://learn.microsoft.com/en-us/training/modules/azure-event-grid/8-event-grid-custom-events