$disk = Get-WmiObject -Class Win32_LogicalDisk -Filter "DeviceID='C:'" Select-Object Size,FreeSpace

$disk.Size
$disk.FreeSpace