$color = 'red'

Select-Object -InputObject $color -Property *

$color.Length

Get-Member -InputObject $color

Get-Member -InputObject $color -Name Remove
