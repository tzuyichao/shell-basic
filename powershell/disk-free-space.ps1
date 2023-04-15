$disks = Get-Volume | Where-Object {$_.DriveType -eq 'Fixed'}
foreach ($disk in $disks) {
    $size = $disk.Size
    $freeSpace = $disk.SizeRemaining
    $freeSpacePercentage = [math]::Round(($freeSpace / $size) * 100, 2)
    Write-Host "$($disk.DriveLetter)[$($disk.FileSystemType)]: $($freeSpacePercentage)% free"
}
