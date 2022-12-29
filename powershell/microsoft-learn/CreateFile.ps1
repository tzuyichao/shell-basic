# CreateFile.ps1
Param(
    [Parameter(Mandatory, HelpMessage = "Please provide a valid path")]
    [string]$Path
)

IF (-Not $Path -eq '') {
    New-Item $Path
    Write-Host "File $Path was created"
} Else {
    Write-Error "Path cannot be empty"
}

