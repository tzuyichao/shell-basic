# How to use managed identities with Azure Container Instances

## Procdure

### Create Key Vault

        export RGNAME=aci-mi-rg
        export MYLOCATION=southeastasia
        export KVNAME=mykeyvault-$RANDOM

        az group create --name $RGNAME --location $MYLOCATION

        az keyvault create --name $KVNAME \
            --resource-group $RGNAME \
            --location $MYLOCATION

        az keyvault secret set \
            --name SampleSecret \
            --value "Hello Container Instances" \
            --description ACIsecret \
            --vault-name $KVNAME

### Use a user-assigned identity to access key vault

### Use a system-assigned identity to access key vault

1. Enable system-assigned identity on container group

2. Check identity

3. Get service principal ID for set access policy

4. Set access policy to key vault

5. Verify container can access key vault


## Clean up

        az group delete --name $RGNAME --no-wait

## Reference

https://learn.microsoft.com/en-us/azure/container-instances/container-instances-managed-identity
