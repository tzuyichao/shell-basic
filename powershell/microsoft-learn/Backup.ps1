Param(
    [string]$Path = './app',
    [string]$DestinationPath = './'
)

IF (-Not (Test-Path $Path)) {
    Throw "The source directory $Path does not exist, please specify an existing directory."
} Else {
    $date = Get-Date -format "yyyy-MM-dd"
    $DestinationFile = "$($DestinationPath + 'backup-' + $date + '.zip')"
    If (-Not (Test-Path $DestinationFile)) {
        Compress-Archive -Path $Path -CompressionLevel 'Fastest' -DestinationPath $DestinationFile
        Write-Host "Created backup at $DestinationFile"
    } Else {
        Write-Error "Today's backup already exists"
    }
}