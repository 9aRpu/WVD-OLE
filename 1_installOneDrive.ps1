# Silently install Adobe Reader DC 
New-Item -Path C:\\ -Name CustomSoftware -ItemType Directory -ErrorAction SilentlyContinue
$LocalPath = 'C:\\CustomSoftware'

# Download the installer from the Adobe website. Always check for new versions!!
$source = "https://oneclient.sfx.ms/Win/MsitFast/19.024.0205.0001/OneDriveSetup.exe"
$destination = "$LocalPath\OneDriveSetup.exe"
Invoke-WebRequest $source -OutFile $destination

# Start the installation when download is finished
Start-Process -FilePath "$LocalPath\OneDriveSetup.exe" -ArgumentList "/uninstall /silent" -Wait

cmd.exe /c 'REG ADD "HKLM\Software\Microsoft\OneDrive" /v "AllUsersInstall" /t REG_DWORD /d 1 /reg:64'

Start-Process -FilePath "$LocalPath\OneDriveSetup.exe" -ArgumentList "/allusers /silent" -Wait

cmd.exe /c 'REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDrive /t REG_SZ /d "C:\Program Files (x86)\Microsoft OneDrive\OneDrive.exe /background" /f'

cmd.exe /c 'REG ADD "HKLM\SOFTWARE\Policies\Microsoft\OneDrive" /v "SilentAccountConfig" /t REG_DWORD /d 1 /f'

Remove-Item 'C:\\CustomSoftware' -Force
