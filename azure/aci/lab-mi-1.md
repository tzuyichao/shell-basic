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

        rgID=$(az group show --name $RGNAME --query id --output tsv)

        az container create \
            --resource-group $RGNAME \
            --name mycontainer \
            --image mcr.microsoft.com/azure-cli \
            --assign-identity --scope $rgID \
            --command-line "tail -f /dev/null"

2. Check identity

        az container show \
            --resource-group $RGNAME \
            --name mycontainer


3. Get service principal ID for set access policy

        spID=$(az container show \
            --resource-group $RGNAME \
            --name mycontainer \
            --query identity.principalId --out tsv)

4. Set access policy to key vault

        az keyvault set-policy \
            --name mykeyvault \
            --resource-group $RGNAME \
            --object-id $spID \
            --secret-permissions get

5. Verify container can access key vault

    az container exec \
        --resource-group $RGNAME \
        --name mycontainer \
        --exec-command "/bin/bash"

in container, using following commands to verify can get value of secret from key vault.

    az login --identity

    az keyvault secret show \
        --name SampleSecret \
        --vault-name mykeyvault --query value


## Clean up

        az group delete --name $RGNAME --no-wait

## Reference

https://learn.microsoft.com/en-us/azure/container-instances/container-instances-managed-identity
