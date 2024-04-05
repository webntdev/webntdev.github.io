function FindChromePath {
    $chromePath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe').'(default)'
    return $chromePath
}

function IsChromeRunning {
    $chromeProcess = Get-Process "chrome" -ErrorAction SilentlyContinue
    return $chromeProcess -ne $null
}

function OpenChrome {
    $chromePath = FindChromePath
    if ($chromePath -ne $null) {
        Start-Process $chromePath "https://www.google.com"
        Write-Host ""
    }
}

while ($true) {
    $chromeRunning = IsChromeRunning
    if (-not $chromeRunning) {
        OpenChrome
    }
    Start-Sleep -Seconds 0.1
}

