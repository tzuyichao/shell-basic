# Exercise: Create Blob storage resources by using the .NET client library

## Procedure

1. create storage account

        az login
        az group create --location southeastasia --name az204-blob-rg
        az storage account create --resource-group az204-blob-rg --name az204blob0125 --location southeastasia --sku Standard_LRS

2. get credentials for the storage account

get connection string for key1 at Security + networking section's access key.

3. prepare .net project

        dotnet new console -n az204-blob
        cd az204-blob
        dotnet build
        mkdir data

    add Azure Blob Storage client library for .NET package

        dotnet add package Azure.Storage.Blobs

4. using client library 

5. running

        dotnet build
        dotnet run

## Clean up

        az group delete --name az204-blob-rg --no-wait



## Reference

https://learn.microsoft.com/en-us/training/modules/work-azure-blob-storage/3-develop-blob-storage-dotnet