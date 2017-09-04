Clear-Host;
Write-Host "Setting up minimal environments..." -ForegroundColor Yellow;
Write-Host "Profile location: $Profile" -ForegroundColor Blue;
if ($null -ne $WorkDocs) {
  Write-Host "WorkDocs location: $WorkDocs" -ForegroundColor Blue;
}
if ($null -ne $OneDrive) {
  Write-Host "OneDrive location: $OneDrive" -ForegroundColor Blue;
}
if ($null -ne $SyncRoot) {
  Write-Host "Sync root: $SyncRoot" -ForegroundColor Blue;
} else {
  Write-Host "Sync root not found!" -ForegroundColor Red;
}
$env:APPLICATION_ENV = "development";
$env:HOME = Resolve-Path ("~");

Wrap-Ls;

Verify-Path "~/Programs/unison" >$null;
if (Verify-Command "unison") {
	Write-Host "unison loaded." -ForegroundColor Green;
}

Verify-Path "~/Programs/putty" >$null;
Verify-Path "~/Programs/putty/App/putty" >$null;
Verify-Path "~/Programs/PortableApps/puttyportable" >$null;
Verify-Path "~/Programs/PortableApps/puttyportable/App/putty" >$null;
Verify-Path "D:/Program Files/putty" >$null;
if (Verify-Command "pageant") {
	pageant (Get-Item ~/.ssh/*.ppk)
	$env:GIT_SSH=(Verify-Command -o "plink").Path;
	Write-Host "pageant loaded." -ForegroundColor Green;
}
Verify-Bin "Git" >$null;
$gitPath = (Verify-Command -o "git").Path;
if ($null -ne $gitPath) {
  Verify-Path "$gitPath/../../cmd" >$null;
  Verify-Path "$gitPath/../../usr/bin" >$null;
  # ssh-init;
}
Verify-Module "posh-git";
X-init;

# if ((Verify-Command "svn") -eq $true) {
#   Verify-Module "posh-svn";
# }
# if ((Verify-Command "hg") -eq $true) {
#   Verify-Module "posh-hg";
# }
# if ((Verify-Command "npm") -eq $true) {
#   Verify-Module "posh-npm";
# }

Verify-Module "Execute-With-Retry";
Verify-Path "C:\Program Files\Amazon\AWSCLI" >$null;
# mw-init;

Write-Host "Done." -ForegroundColor Yellow;
Set-Location ~;
Get-Content ~/setup/banner.md;
