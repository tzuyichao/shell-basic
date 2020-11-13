Set-Location $env:TEMP
New-Item IMadeThisUp.txt -Force
Remove-Item .\IMadeThisUp.txt -WhatIf
Get-Item IMadeThisUp.txt
