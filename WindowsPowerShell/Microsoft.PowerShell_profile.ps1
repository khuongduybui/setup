#Global Functions
function    ..              { Set-Location ..; }
function    ...             { Set-Location ..\..; }
function    la              { Get-ChildItem -force $args; }
Set-Alias   l               ls
Set-Alias   ll              la
Set-Alias   grep            Select-String
Set-Alias   which           Get-Command
Set-Alias   run             Start-Process
Set-Alias   tor             Fetch-Torrent
Set-Alias   acc             Accounts
Set-Alias   sup             Supervisor-App
function    reload          { Environment-Init }
function    mklink          { cmd /c mklink $args; }
function    bcopy           { cmd /c copy /b $args; }
function    myip            { ipconfig | gawk "/(adapter|IPv4 Address)/"; }
Set-Alias   code            c2c.ps1
function    sshp            { ssh -o ProxyCommand=None $args; }
function    ssh-corp        { ssh -o ProxyCommand=None $args; }
function    docker-ip       { docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $args; }

#GIT Functions
function    g               { git status $args; }
function    gb              { git branch $args; }
function    gst             { git status $args; }
function    gco             { git checkout $args; }
function    gdf             { git diff --ignore-space-change $args; }
function    gbd             { git branch -D $args; }

#Node Functions
Set-Alias   ver             Get-Version

#init
$Profile = $myInvocation.mycommand.path
. "$(Split-Path $Profile)\Functions\*.ps1";

$SpecialFolders = @{}
$names = [Environment+SpecialFolder]::GetNames([Environment+SpecialFolder])
foreach($name in $names)
{
  if($path = [Environment]::GetFolderPath($name)){
    $SpecialFolders[$name] = $path
  }
}

$env:Path += ";$(Split-Path $Profile)\Scripts"
$env:PSModulePath = $env:PSModulePath -replace ("$([Environment]::GetFolderPath("MyDocuments"))\WindowsPowerShell\Modules" -replace "\\", "\\"), "$(Split-Path $Profile)\Modules"

$HistoryFilePath = Join-Path ([Environment]::GetFolderPath('UserProfile')) .ps_history
Register-EngineEvent PowerShell.Exiting -Action { Get-History | Export-Clixml $HistoryFilePath } | Out-Null
if (Test-path $HistoryFilePath) { Import-Clixml $HistoryFilePath | Add-History }

$WorkDocs = find-work-docs 2>$null;
if ($null -ne $WorkDocs) {
  $SyncRoot = $WorkDocs;
}

$OneDrive = find-onedrive 2>$null;
if ($null -ne $OneDrive) {
  $SyncRoot = $OneDrive;
}

Environment-Init;

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
