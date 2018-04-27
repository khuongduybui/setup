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

verify-path "~/Programs/unison" >$null;
if (verify-command "unison-fsmonitor") {
	Write-Host "unison loaded." -ForegroundColor Green;
}

verify-path "~/Programs/putty" >$null;
verify-path "~/Programs/putty/App/putty" >$null;
verify-path "~/Programs/PortableApps/puttyportable" >$null;
verify-path "~/Programs/PortableApps/puttyportable/App/putty" >$null;
verify-path "D:/Program Files/putty" >$null;
if (verify-command "pageant") {
	pageant (Get-Item ~/.ssh/*.ppk)
	$env:GIT_SSH=(verify-command -o "plink").Path;
	Write-Host "pageant loaded." -ForegroundColor Green;
}
verify-bin "git" >$null;
$gitPath = (verify-command -o "git").Path;
if ($null -ne $gitPath) {
  verify-path "$gitPath/../../cmd" >$null;
  verify-path "$gitPath/../../usr/bin" >$null;
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
verify-path "C:\Program Files\Amazon\AWSCLI" >$null;
# mw-init;

Write-Host "Done." -ForegroundColor Yellow;
Set-Location ~;
Get-Content ~/setup/banner.md;
