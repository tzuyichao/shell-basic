foreach($file in Get-ChildItem)
{
    if($file.length -gt 100)
    {
        Write-Host $file
    }
}