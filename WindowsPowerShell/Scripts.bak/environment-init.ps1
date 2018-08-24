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

wrap-ls;

Verify-Path "~/Programs/unison" >$null;
if (verify-command "unison-fsmonitor") {
	Write-Host "unison loaded." -ForegroundColor Green;
}

Verify-Path "~/Programs/putty" >$null;
Verify-Path "~/Programs/putty/App/putty" >$null;
Verify-Path "~/Programs/PortableApps/puttyportable" >$null;
Verify-Path "~/Programs/PortableApps/puttyportable/App/putty" >$null;
Verify-Path "D:/Program Files/putty" >$null;
if (verify-command "pageant") {
	pageant (Get-Item ~/.ssh/*.ppk)
	$env:GIT_SSH=(verify-command -o "plink").Path;
	Write-Host "pageant loaded." -ForegroundColor Green;
}
Verify-Bin "git" >$null;
$gitPath = (verify-command -o "git").Path;
if ($null -ne $gitPath) {
  Verify-Path "$gitPath/../../cmd" >$null;
  Verify-Path "$gitPath/../../usr/bin" >$null;
  # ssh-init;
}
verify-module "posh-git";
x-init;

# if ((verify-command "svn") -eq $true) {
#   verify-module "posh-svn";
# }
# if ((verify-command "hg") -eq $true) {
#   verify-module "posh-hg";
# }
# if ((verify-command "npm") -eq $true) {
#   verify-module "posh-npm";
# }

verify-module "Execute-With-Retry";
Verify-Path "C:\Program Files\Amazon\AWSCLI" >$null;
# mw-init;

Write-Host "Done." -ForegroundColor Yellow;
Set-Location ~;
Get-Content ~/setup/banner.md;
