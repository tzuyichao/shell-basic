$disks = Get-PSDrive -PSProvider FileSystem | Where-Object {$_.Free -ne $null}
foreach ($disk in $disks) {
    $size = $disk.Used + $disk.Free
    $freeSpace = $disk.Free
    $freeSpacePercentage = [math]::Round(($freeSpace / $size) * 100, 2)
    Write-Host "$($disk.Name): $($freeSpacePercentage)% free"
}
