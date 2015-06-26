clear;
Write-Host "Setting up environments..." -ForegroundColor Yellow;

$env:APPLICATION_ENV = "development";
$env:HOME = Resolve-Path ("~");

#$env:Path="$env:Path;C:\Program Files (x86)\Mono-3.2.3\bin"
#$env:Path="$env:Path;$(Resolve-Path ~\Programs\movie-tools\libwebp-0.4.0-windows-x64\bin)"

#$env:GOROOT="$(Resolve-Path ~\Programs\go)"
#$env:GOPATH="$(Resolve-Path ~\Programs\go\path)"
#$env:Path="$env:Path;$(Resolve-Path ~\Programs\go\bin);$(Resolve-Path ~\Programs\go\path\bin)"

Wrap-Ls;

Set-PSRepository -Name PSGallery -InstallationPolicy Trusted > $null;
Set-PackageSource -Name chocolatey -Trusted > $null;

Write-Host "Verifying applications.." -ForegroundColor Yellow;
Sysinternals-Init;
# Verify-Choco atom > $null;
# Verify-Choco SublimeText3 > $null;
Verify-Choco picasa > $null;
Verify-Choco calibre > $null;
Verify-Choco audacity > $null;
Verify-Choco javaruntime > $null;

Write-Host "Verifying Languages..." -ForegroundColor Yellow;
# Verify-Choco ruby > $null;
Verify-Choco python2 > $null;Verify-Path "$env:SystemDrive\Python27"; Verify-Path "$env:SystemDrive\Python27\Scripts";
# Verify-Choco perl > $null;
Verify-Choco io.js > $null;
Verify-Choco jdk8 > $null;
# Verify-Choco golang > $null;

Write-Host "Verifying VCSs..." -ForegroundColor Yellow;
Verify-Choco git.install > $null;
# Verify-Choco hg > $null;
# Verify-Choco svn > $null;

Write-Host "Verifying DBMSes..." -ForegroundColor Yellow;
Verify-Choco HeidiSQL > $null;
# Verify-Choco redis > $null;
Verify-Choco mongodb > $null;
Verify-Choco robomongo > $null;

Write-Host "Verifying dev tools..." -ForegroundColor Yellow;
Verify-Choco ant > $null;
Verify-Path "~\AppData\Roaming\npm";
Verify-Npm mocha > $null;
Verify-Npm cordova > $null;
Verify-Npm express -package express-generator > $null;
Verify-Npm nodemon > $null;

#Xampp-Init;
#Bitnami-Init;
#Android-Init;

Write-Host "Verifying PowerShellGet modules..." -ForegroundColor Yellow;
Verify-PS-Module "Pscx";
Verify-PS-Module "ShowUI";
Verify-PS-Module "PsReadline";
# if you don't already have this configured...
Set-PSReadLineOption -HistoryNoDuplicates 
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -HistorySaveStyle SaveIncrementally
Set-PSReadLineOption -MaximumHistoryCount 4000
# history substring search
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
# Tab completion
Set-PSReadlineKeyHandler -Chord 'Shift+Tab' -Function Complete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

Write-Host "Verifying PsGet modules..." -ForegroundColor Yellow;
$global:PsGetDestinationModulePath = "$(Split-Path $Profile)\Modules";
Verify-Module "PsGet";
Verify-Module "Find-String" "awk";
$gitPath = (Verify-Command -o "git").Path;
if ($gitPath -ne $null) {
  Verify-Path "$gitPath/../../bin";
  Verify-Module "posh-git";
  ssh-add "~/.ssh/openfisma-ec2.pem";
}
if ((Verify-Command "svn") -eq $true) {
  Verify-Module "posh-svn";
}
if ((Verify-Command "hg") -eq $true) {
  Verify-Module "posh-hg";
}

if ((Verify-Command "npm") -eq $true) {
  Verify-Module "posh-npm";
}

Write-Host "Done." -ForegroundColor Yellow;
cd ~;
