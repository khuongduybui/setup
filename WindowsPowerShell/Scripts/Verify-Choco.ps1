param([parameter(mandatory=$true)][string] $command, [switch] $f);

$test = Get-Package -Name $command -ProviderName programs,chocolatey -ErrorAction SilentlyContinue;
if ($test -eq $null) {
  if ($f -eq $false) {
    Write-Host "$command missing! Run Verify-Choco -command $command -f to install." -ForegroundColor Red;
    return $false;
  } else {
    Write-Host "$command missing! Attempting to install..." -ForegroundColor DarkYellow;
    Install-Package -Name $command -Source chocolatey;
    return Verify-Choco -command $command;
  }
} else {
  Write-Host $command $test.Version -ForegroundColor DarkGreen;
  return $true;
}
