# Silently install Adobe Reader DC 
New-Item -Path C:\\ -Name CustomSoftware -ItemType Directory -ErrorAction SilentlyContinue
$LocalPath = 'C:\\CustomSoftware'

# Download the installer from the Adobe website. Always check for new versions!!
$source = "https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/2100120145/AcroRdrDC2100120145_en_US.exe"
$destination = "$LocalPath\AcroRdrDC2100120145_en_US.exe"
Invoke-WebRequest $source -OutFile $destination

# Start the installation when download is finished
Start-Process -FilePath "$LocalPath\AcroRdrDC2100120145_en_US.exe" -ArgumentList "/sAll /rs /rps /msi /norestart /quiet ALLUSERS=1 EULA_ACCEPT=YES"

#Install Notepad++
$sourceNotepadPP = "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v7.9.4/npp.7.9.4.Installer.x64.exe"
$destinationNotepadPP = "$LocalPath\npp.7.9.4.Installer.x64.exe"
Invoke-WebRequest $sourceNotepadPP -OutFile $destinationNotepadPP
Start-Process -FilePath "$LocalPath\npp.7.9.4.Installer.x64.exe" -ArgumentList "/S" -Wait -Passthru

#Install 7-zip https://www.7-zip.org/a/7z1900-x64.exe
$source7Zip = "https://www.7-zip.org/a/7z1900-x64.exe"
$destination7Zip = "$LocalPath\7z1900-x64.exe"
Invoke-WebRequest $source7Zip -OutFile $destination7Zip
Start-Process -FilePath "$LocalPath\7z1900-x64.exe" -ArgumentList "/S" -Wait -Passthru
