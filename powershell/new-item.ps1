$cmd = Get-Command New-Item

$cmd.Parameters.Count
$cmd.Parameters.Name
$cmd.HelpUri
Set-Location -Path $cmd.Module.ModuleBase