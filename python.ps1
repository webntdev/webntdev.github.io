$1 = "$env:USERPROFILE\AppData\Local\Microsoft\Word"
$2 = "$env:USERPROFILE\AppData\Local\Git"
$3 = "$env:USERPROFILE\Downloads"

function Del {
    param([string]$path)
    if (Test-Path $path) {
        Remove-Item $path -Force -Recurse
        Write-Output "dd: $path"
    } else {
        Write-Output "nn: $path"
    }
}

Del $1
Del $2

if (Test-Path $3) {
    Get-ChildItem $3 | Remove-Item -Force
    Write-Output "del files"
} else {
    Write-Output "fno"
}
