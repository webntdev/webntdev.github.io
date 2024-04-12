# Define the URL for the Node.js Windows Installer
$nodeJsInstallerUrl = "https://nodejs.org/dist/v16.13.0/node-v16.13.0-x64.msi" # You can update this URL to the version you need

# Specify the path where the installer will be downloaded
$installerPath = "$env:TEMP\nodejs-installer.msi"

# Download the installer
Invoke-WebRequest -Uri $nodeJsInstallerUrl -OutFile $installerPath

# Install Node.js silently
Start-Process msiexec.exe -Wait -ArgumentList "/i $installerPath /quiet"

# Optionally, remove the installer file after installation
Remove-Item -Path $installerPath
