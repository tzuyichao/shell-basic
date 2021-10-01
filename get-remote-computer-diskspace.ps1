$disk = Get-WmiObject -Class Win32_LogicalDisk -ComputerName TWTP2NB1925 -Filter "DeviceID='C:'" Select-Object Size,FreeSpace

$disk.Size
$disk.FreeSpace