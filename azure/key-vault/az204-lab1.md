# Exercise: Set and retrieve a secret from Azure Key Vault by using Azure CLI

## Procedure

Using Azure Cloud Shell with Bash

1. Create Key Vault
    
    Enviroment Variable

        myKeyVault=az204vault-$RANDOM
        myLocation=southeastasia
        myRG=az204-vault-rg

    Create Resource Group

        az group create --name $myRG --location $myLocation

    Create Key Vault

        az keyvault create --name $myKeyVault --resource-group $myRG --location $myLocation


2. Add and retrieve a secret

    Create a secret

        az keyvault secret set --vault-name $myKeyVault --name "ExamplePassword" --Value "hVFkk965BuUv"

    retrieve the secret

        az keyvault secret show --nane "ExamplePassword" --vault-name $myKeyVault

## Clean up resources

        az group delete --name $myRG --no-wait

## Reference

https://learn.microsoft.com/en-gb/training/modules/implement-azure-key-vault/5-set-retrieve-secret-azure-key-vault