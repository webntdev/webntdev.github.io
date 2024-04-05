# Specify the YouTube link
$youtubeLink = "https://youtu.be/dQw4w9WgXcQ?si=CZkDDWPqwej3_twg"

# Command to open Chrome with the YouTube link
Start-Process "chrome.exe" -ArgumentList $youtubeLink
