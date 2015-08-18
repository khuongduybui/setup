clear;
Write-Host "Setting up minimal environments..." -ForegroundColor Yellow;

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
