param([switch] $f, [switch] $l, [switch] $u, [switch] $v)
if ((Verify-Command "choco") -eq $true) {
  Write-Host "choco installed." -ForegroundColor DarkGreen;
  if ($v -eq $true) {
    choco version | grep "found  " | Write-Host -ForegroundColor DarkGreen;
  }
  if ($u -eq $true) {
    #choco update;
  }
  if ($l -eq $true) {
    return choco list -lo;
  }
} else {
  if ($f -eq $false) {
    Write-Host "choco missing! Run Choco-Init -f to install." -ForegroundColor Red;
  } else {
    Write-Host "choco missing! Fetching..." -ForegroundColor Yellow;
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'));
    return Choco-Init $f $l $u;
  }
}
