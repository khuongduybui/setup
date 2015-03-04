param([parameter(mandatory=$true)][string] $command, $list, [switch] $f);

if ($list -eq $null) {
  $list = choco list -lo;
}
$test = $list | grep $command;
if ($test -eq $null) {
  if ($f -eq $false) {
    Write-Host "$command missing! Run Verify-Choco -command $command -f to install." -ForegroundColor Red;
    return $false;
  } else {
    Write-Host "$command missing! Attempting to install..." -ForegroundColor DarkYellow;
    cinst $command;
    return Verify-Choco -command $command;
  }
} else {
  Write-Host "$test" -ForegroundColor DarkGreen;
  return $true;
}
