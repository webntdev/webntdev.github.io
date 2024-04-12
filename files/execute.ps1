Start-Sleep -Seconds 10

$url = "https://nodejs.org/dist/v20.12.2/node-v20.12.2-x64.msi"
$downloadPath = "$env:USERPROFILE\Downloads\nodeinstaller.msi"

Invoke-WebRequest -Uri $url -OutFile $downloadPath

Start-Process "msiexec.exe" -ArgumentList "/i `"$downloadPath`" /passive" -Wait
