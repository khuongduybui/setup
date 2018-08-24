# Turn-on Verbose output as needed
$VerbosePreference = "Continue"

# Set up custom paths for functions, scripts, modules
$Profile = $myInvocation.mycommand.path
Write-Verbose "Profile detected at $Profile."
$ProfilePath = $(Split-Path $Profile)
$Functions = @()
$FunctionPath = "$ProfilePath\Functions"
if (Test-Path $FunctionPath) {
  Write-Verbose "Importing functions from $FunctionPath."
  foreach ($FunctionFile in $(Get-ChildItem $FunctionPath)) {
    $FunctionName = $FunctionFile -replace "\.ps1", ""
    $Functions += $FunctionName
    Import-Module "$FunctionPath\$FunctionFile" -Force
  }
}
$ScriptPath = "$ProfilePath\Scripts"
if (Test-Path $ScriptPath) {
  Write-Verbose "Importing functions from $ScriptPath."
  $env:Path += ";$ScriptPath"
}
$ModulePath = "$ProfilePath\Modules"
if (Test-Path $ModulePath) {
  Write-Verbose "Importing functions from $ModulePath."
  $DefaultModulePath = "$([Environment]::GetFolderPath("MyDocuments"))\WindowsPowerShell\Modules"
  $env:PSModulePath = $env:PSModulePath -replace ($DefaultModulePath -replace "\\", "\\"), "$ModulePath"
}

# Set up common environment variables
$SpecialFolders = @{}
$names = [Environment+SpecialFolder]::GetNames([Environment+SpecialFolder])
foreach($name in $names)
{
  if($path = [Environment]::GetFolderPath($name)){
    $SpecialFolders[$name] = $path
    Write-Verbose "$name detected at $path."
  }
}

$OneDrive = Find-OneDrive
if ($null -ne $OneDrive) {
  $SyncRoot = $OneDrive
}

# $HistoryFilePath = Join-Path ([Environment]::GetFolderPath('UserProfile')) .ps_history
# Register-EngineEvent PowerShell.Exiting -Action { Get-History | Export-Clixml $HistoryFilePath } | Out-Null
# if (Test-path $HistoryFilePath) { Import-Clixml $HistoryFilePath | Add-History }

# environment-init;

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path $ChocolateyProfile) {
  Import-Module "$ChocolateyProfile"
}
