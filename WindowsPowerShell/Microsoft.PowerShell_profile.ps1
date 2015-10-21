#init
$Profile = $myInvocation.mycommand.path
$OneDrive = (Get-ItemProperty -Path "hkcu:\Software\Microsoft\Windows\CurrentVersion\SkyDrive\" -Name UserFolder -ErrorAction Silent).UserFolder;
if ($OneDrive -eq $ne) {
  $OneDrive = (Get-ItemProperty -Path "hkcu:\Software\Microsoft\OneDrive\" -Name UserFolder -ErrorAction Silent).UserFolder;
}
if ($OneDrive -eq $ne) {
  $OneDrive = Resolve-Path "~/OneDrive";
}

#Global Functions
function    ..              { cd ..; }
function    ...             { cd ..\..; }
function    la              { Get-ChildItem -force $args; }
Set-Alias   l               ls
Set-Alias   ll              la
Set-Alias   grep            Select-String
Set-Alias   which           Get-Command
Set-Alias   run             Start-Process
Set-Alias   tor             Fetch-Torrent
Set-Alias   acc             Accounts
Set-Alias   sup             Supervisor-App
Set-Alias   reload          Environment-Init
function    mklink          { cmd /c mklink $args; }
function    bcopy           { cmd /c copy /b $args; }
function    myip            { ipconfig | gawk "/(adapter|IPv4 Address)/"; }
Set-Alias   code            c2c.ps1

#Google-App-Engine Functions
Set-Alias   gphp            Gapp-Php

#XAMPP Functions
function    mysql-root      { mysql --user=root $args; }

#GIT Functions
function    g               { git status $args; }
function    gb              { git branch $args; }
function    gst             { git status $args; }
function    gco             { git checkout $args; }
function    gdf             { git diff --ignore-space-change $args; }
function    gbd             { git branch -D $args; }

#Node Functions
Set-Alias   ver             Get-Version

$env:Path += ";$(Split-Path $Profile)\Scripts"
$env:PSModulePath = $env:PSModulePath -replace ("$([Environment]::GetFolderPath("MyDocuments"))\WindowsPowerShell\Modules" -replace "\\", "\\"), "$(Split-Path $Profile)\Modules"

$HistoryFilePath = Join-Path ([Environment]::GetFolderPath('UserProfile')) .ps_history
Register-EngineEvent PowerShell.Exiting -Action { Get-History | Export-Clixml $HistoryFilePath } | out-null
if (Test-path $HistoryFilePath) { Import-Clixml $HistoryFilePath | Add-History } else { echo $HistoryFilePath }

Environment-Init
