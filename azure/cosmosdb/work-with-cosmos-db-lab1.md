# Create resources by using the Microsoft .NET SDK v3

## Procedure

### Setting up

#### Connecting to Azure

```
az login
```

#### Create resources in Azure

1. Create resource group

```
az group create --location southeastasia --name az204-cosmos-rg 
```

2. Ctrate Azure Codmos DB. Record *documentEndpoint* from command results.

```
az cosmosdb create --name <myCosmosDBacct> --resource-group az204-cosmos-rg
```

3. Retrieve primary key. Record *primaryMasterKey* from command results.

```
az cosmosdb keys list --name <myCosmosDBacct> --resource-group az204-cosmos-rg
```

### Set up the console application

1. Create folder for the projcet

```
md az204-cosmos
cd az204-cosmos
```

2. Create tje .NET console app

```
dotnet new console
```

3.  Open the current folder in VS Code. Select *Program.cs* file.

```
code . -r
```

4. Add packages

```
dotnet add package Microsoft.Azure.Cosmos
```

### Building the console app

### Verify

```
dotnet run
```

Azure cli command to list database from Azure Cosmos DB.

```
 az cosmosdb sql database list --account-name <myCosmosDBacct> --resource-group az204-cosmos-rg
```

Azure cli command to list container from Azure Cosmos DB

```
az cosmosdb sql container list --database-name az204Database --account-name <myCosmosDBacct> --resource-group az204-cosmos-rg
```

## Clean Up

```
az group delete --name az204-cosmos-rg --no-wait
```

## Reference

* https://learn.microsoft.com/en-us/training/modules/work-with-cosmos-db/3-exercise-work-cosmos-db-dotnet

* https://learn.microsoft.com/en-us/cli/azure/cosmosdb/sql/database?view=azure-cli-latest

* https://learn.microsoft.com/en-us/cli/azure/cosmosdb/sql/container?view=azure-cli-latest