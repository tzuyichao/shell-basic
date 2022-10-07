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
