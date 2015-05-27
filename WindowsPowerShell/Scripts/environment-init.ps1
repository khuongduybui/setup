clear;
Write-Host "Setting up environments..." -ForegroundColor Yellow;

$APPLICATION_ENV = "development";
$env:HOME = Resolve-Path ("~");

#$env:Path="$env:Path;C:\Program Files (x86)\Mono-3.2.3\bin"
#$env:Path="$env:Path;$(Resolve-Path ~\Programs\movie-tools\libwebp-0.4.0-windows-x64\bin)"

#$env:GOROOT="$(Resolve-Path ~\Programs\go)"
#$env:GOPATH="$(Resolve-Path ~\Programs\go\path)"

#$env:Path="$env:Path;$(Resolve-Path ~\Programs\go\bin);$(Resolve-Path ~\Programs\go\path\bin)"
Wrap-Ls;

Write-Host "Verifying applications.." -ForegroundColor Yellow;
Sysinternals-Init;
$list = Choco-Init -l;
Verify-Choco -list $list atom > $null;
Verify-Choco -list $list picasa > $null;
Verify-Choco -list $list calibre > $null;
Verify-Choco -list $list javaruntime > $null;

Write-Host "Verifying Languages..." -ForegroundColor Yellow;
Verify-Choco -list $list ruby > $null;
Verify-Choco -list $list python > $null;
Verify-Choco -list $list perl > $null;
Verify-Choco -list $list nodejs.install > $null;
Verify-Choco -list $list jdk > $null;
Verify-Choco -list $list golang > $null;

Write-Host "Verifying VCSs..." -ForegroundColor Yellow;
Verify-Choco -list $list git.install > $null;
Verify-Choco -list $list hg > $null;
Verify-Choco -list $list svn > $null;

Write-Host "Verifying DBMSes..." -ForegroundColor Yellow;
Verify-Choco -list $list redis > $null;
Verify-Choco -list $list mongo > $null;

Write-Host "Verifying dev tools..." -ForegroundColor Yellow;
Verify-Choco -list $list ant > $null;
Verify-Npm mocha > $null;
Verify-Npm cordova > $null;
Verify-Npm express -package express-generator > $null;
Verify-Npm nodemon > $null;
#Xampp-Init;
#Bitnami-Init;
#Android-Init;

Write-Host "Verifying Pscx modules..." -ForegroundColor Yellow;
Verify-Module "PsGet";
Verify-Module "Pscx";
Verify-Module "Find-String" "awk";
Verify-Module "PsReadline";

$gitPath = (Verify-Command -o "git").Path;
if ($gitPath -ne $null) {
  $env:Path="$env:Path;$(Resolve-Path "$gitPath/../../bin")";
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

#$HistoryFilePath = Join-Path ([Environment]::GetFolderPath('UserProfile')) .ps_history
#Register-EngineEvent PowerShell.Exiting -Action { Get-History | Export-Clixml $HistoryFilePath } | out-null
#if (Test-path $HistoryFilePath) { Import-Clixml $HistoryFilePath | Add-History } else { echo $historyfilepath }
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

Write-Host "Done." -ForegroundColor Yellow;
cd ~;