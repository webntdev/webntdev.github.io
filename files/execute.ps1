# This is a generic example and might not work with your specific Google Drive link due to security restrictions
$url = "YourPublicGoogleDriveDownloadLinkHere"
$downloadPath = Join-Path -Path $env:USERPROFILE -ChildPath "Downloads\YourFileNameHere"

# Attempt to bypass redirects by using Invoke-WebRequest with -MaximumRedirection 0
try {
    Invoke-WebRequest -Uri $url -OutFile $downloadPath -MaximumRedirection 0
}
catch {
    # If the above fails due to redirection, try to extract the redirected URL from the exception
    $redirectedUrl = $_.Exception.Response.Headers.Location
    if ($redirectedUrl) {
        # Try downloading using the redirected URL
        Invoke-WebRequest -Uri $redirectedUrl -OutFile $downloadPath
    }
}
