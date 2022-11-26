### Deploy


```
PS D:\lab\powershell-basic\arm-template\network> $rgName = 'testrg'
PS D:\lab\powershell-basic\arm-template\network> New-AzResourceGroupDeployment `
>>   -ResourceGroupName $rgName `
>>   -TemplateFile .\create-a-virtual-network.json `
>>   -TemplateParameterFile .\create-a-virtual-network-parameters.json
```


### Verify


```
Get-AzVirtualNetwork -Name 'VNet1' -ResourceGroupName $rgName
```


### Clean up


```
Remove-AzResourceGroup -Name $rgName
```

### Another Version

#### Deploy

```
$deployment = 'testcreatevirtualnetowkr1'
$rgName = 'testrg'
New-AzResourceGroupDeployment `
 -Name $deployment `
 -ResourceGroupName $rgName `
 -TemplateFile .\create-a-virtual-network.json `
 -TemplateParameterFile .\create-a-virtual-network-parameters.json
```

#### Clean up

```
Remove-AzVirtualNetwork -Name VNet1 -ResourceGroupName $rgName
```

### Reference 

[Quickstart: Create a virtual network - Resource Manager template](https://learn.microsoft.com/en-us/azure/virtual-network/quick-create-template)

