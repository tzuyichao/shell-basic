resource storageAccount 'Microsoft.Storage/storageAccounts@2021-08-01' = {
    name: 'toylaunchstorage20221007'
    location: 'westus3'
    sku: {
      name: 'Standard_LRS'
    }
    kind: 'StorageV2'
    properties: {
      accessTier: 'Hot'
    }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2021-03-01' = {
  name: 'toy-product-launch-plan-starter20221007'
  location: 'westus3'
  sku: {
    name: 'F1'
  }
  properties: {}
}

resource appServiceApp 'Microsoft.Web/sites@2021-03-01' = {
  name: 'toy-product-launch-1-20221007'
  location: 'westus3'
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
