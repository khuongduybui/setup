param([switch] $f, [switch] $l, [switch] $u, [switch] $v)
if ((verify-command "choco") -eq $true) {
  Write-Host "choco installed." -ForegroundColor Green;
  if ($v -eq $true) {
    choco version | grep "found  " | Write-Host -ForegroundColor Green;
  }
  if ($u -eq $true) {
    #choco update;
  }
  if ($l -eq $true) {
    return choco list -lo;
  }
} else {
  if ($f -eq $false) {
    Write-Host "choco missing! Run choco-init -f to install." -ForegroundColor Red;
  } else {
    Write-Host "choco missing! Fetching..." -ForegroundColor Yellow;
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));
    return choco-init $f $l $u;
  }
}
