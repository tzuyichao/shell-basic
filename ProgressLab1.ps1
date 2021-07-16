# Source From: https://blog.darkthread.net/blog/ps-report-progress/

Function RunSlowProcess([int]$count) {
    $sheep = @()
    for ($i = 1; $i -le $count; $i++) {
        Start-Sleep 1
        Write-Progress -Activity "Counting " -Status "No. $i sheep" -PercentComplete ($i / $count * 100)
        $sheep += $i
    }
    "Complete-" + $sheep
}

RunSlowProcess (Read-Host "How many sheep?")