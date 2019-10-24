#Requires -RunAsAdministrator
<#
.SYNOPSIS
Enabled Powershell Remoting Over SSH.
.NOTES
Currently assumes you have installed openssh and powershell core, preferably via chocolatey as such:
choco install powershell-core -y
choco install openssh -y -params '"/SSHServerFeature /PathSpecsToProbeForShellEXEString:$env:programfiles\PowerShell\*\pwsh.exe"'
#>
[CmdletBinding()]
param (
    #Path to your Powershell Core Installation. Defaults to Powershell Core 6
    $PWSHPath= "$env:PROGRAMFILES\Powershell\6",
    #A path with no spaces that will be used for the SSHD Link. Default is generally fine.
    $noSpacesPath = "$env:windir\System32\WindowsPowershell\6",
    #Path to your SSHD config file
    $sshdConfigFile = "$env:PROGRAMDATA\ssh\sshd_config"
)

#Sanity Checks
if (-not (test-path $sshdConfigFile)) {throw "SSHD Configuration not found at $sshdConfigFile. Did you install OpenSSH first?"}
$sshdConfig = gc -raw $sshdConfigFile
if ($sshdConfig -match 'Subsystem\s*powershell') {throw "Powershell SSH Remoting config already detected. Delete the Subsystem Powershell section to reinstall"}
if (-not (get-service sshd)) {throw "SSHD is not configured as a windows service. Did you install OpenSSH with /SSHServerFeature?"}
if (-not (Test-path (join-path $pwshpath 'pwsh.exe'))) {throw "pwsh.exe not found at PWSH Path $PWSHPath"}
if (Test-Path $noSpacesPath) {throw "NoSpacesPath $noSpacesPath already exists, please delete so that a link may be created"}

#Make the link
& cmd /C mklink /D $noSpacesPath $PWSHPath

#Verify the link was created
if (-not (test-path $noSpacesPath)) {throw "Failed to create the nonspaced link at $noSpacesPath"}

#Append the nonspaced SSHD config
[Environment]::NewLine + "Subsystem powershell $noSpacesPath\pwsh.exe -sshs -NoLogo -NoProfile" | Out-File -Append -Encoding utf8 $sshdConfigFile

$sshdConfig = gc -raw $sshdConfigFile
if ($sshdConfig -match 'Subsystem\s*powershell') {
    write-host -foreground Green "Powershell over SSH Remoting Enabled. Restarting SSHD"
} else {
    throw "Powershell over SSH Remoting Config Failed. Re-run script for cleanup steps"
}

#Restart the sshd service
Restart-Service sshd