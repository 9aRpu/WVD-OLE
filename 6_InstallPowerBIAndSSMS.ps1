# Silently install Adobe Reader DC 
New-Item -Path C:\\ -Name CustomSoftware -ItemType Directory -ErrorAction SilentlyContinue
$LocalPath = 'C:\\CustomSoftware'

# Download the installer from the Adobe website. Always check for new versions!!
$source = "https://download.microsoft.com/download/8/8/0/880BCA75-79DD-466A-927D-1ABF1F5454B0/PBIDesktopSetup_x64.exe"
$destination = "$LocalPath\PowerBIx64.exe"
Invoke-WebRequest $source -OutFile $destination

# Start the installation when download is finished 
Start-Process -FilePath "$LocalPath\PowerBIx64.exe" -ArgumentList "-norestart -quiet ACCEPT_EULA=1" -Wait -Passthru

# Download the installer from the Adobe website. Always check for new versions!!
$sourceSSMS = "https://aka.ms/ssmsfullsetup"
$destinationSSMS = "$LocalPath\SSMS.exe"
Invoke-WebRequest $sourceSSMS -OutFile $destinationSSMS

Start-Process -FilePath "$LocalPath\SSMS.exe" -Args "/install /quiet" -Verb RunAs -Wait
