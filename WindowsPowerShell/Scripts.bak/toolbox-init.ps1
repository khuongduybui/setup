Invoke-WebRequest -usedefaultcredentials 'https://drive.corp.amazon.com/view/BuilderToolbox/toolbox-install.cmd' -outfile "$env:TEMP/toolbox-install.cmd"
cmd.exe /c '%TEMP%\toolbox-install.cmd'
Remove-Item "$env:TEMP/toolbox-install.cmd"
Verify-Path "$env:LOCALAPPDATA/Toolbox/bin"
