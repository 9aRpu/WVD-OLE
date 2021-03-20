write-host 'AIB Customization: Downloading Office365 Deployment Tool'

New-Item -Path C:\\ -Name office365 -ItemType Directory -ErrorAction SilentlyContinue
$LocalPath = 'C:\\office365'

$ODTURL = 'https://download.microsoft.com/download/2/7/A/27AF1BE6-DD20-4CB4-B154-EBAB8A7D4A7E/officedeploymenttool_13628-20476.exe'
$ODTexe = 'officedeploymenttool.exe'
$outputPath = $LocalPath + '\' + $ODTexe
Invoke-WebRequest -Uri $ODTURL -OutFile $outputPath
set-Location $LocalPath
.\officedeploymenttool.exe /quiet /extract:$LocalPath

Start-Sleep -Seconds 2

$ConfigXMLURL = 'https://raw.githubusercontent.com/9aRpu/WVD-OLE/main/Configuration.xml'
$ConfigXML = 'Configuration.xml'
$outputXMLPath = $LocalPath + '\' + $ConfigXML
Invoke-WebRequest -Uri $ConfigXMLURL -OutFile $outputXMLPath

write-host 'AIB Customization: Starting Install Office 365 Business Premium'
Start-Process "setup.exe" -ArgumentList "/configure Configuration.xml" -Wait -Passthru
write-host 'AIB Customization: Finished Install Office 365 Business Premium'
