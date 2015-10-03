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

Verify-Path "~/Programs/putty";
Verify-Path "~/Programs/putty/App/putty";
if (Verify-Command "pageant") {
	pageant (Get-Item ~/.ssh/*.ppk)
	$env:GIT_SSH=(Verify-Command -o "plink").Path;
	Write-Host "pageant loaded." -ForegroundColor Green;
}

$gitPath = (Verify-Command -o "git").Path;
if ($gitPath -ne $null) {
  Verify-Path "$gitPath/../../bin";
  Verify-Path "$gitPath/../../usr/bin";
  Verify-Module "posh-git";
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

Verify-Path "C:\Program Files\Amazon\AWSCLI";

Write-Host "Done." -ForegroundColor Yellow;
cd ~;
