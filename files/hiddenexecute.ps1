$startTime = Get-Date
$endTime = $startTime.AddSeconds(30)

while (Get-Date -lt $endTime) {
    Start-Process "chrome.exe"
    Start-Sleep -Seconds 1
}
