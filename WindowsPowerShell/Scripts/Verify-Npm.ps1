param([parameter(mandatory=$true)][string] $command, [string] $package, [switch] $f);
if ($package -eq "") {
  $package = $command;
}

if ((Verify-Command $command) -eq $false) {
  if ($f -eq $false) {
    Write-Host "$command missing! Run Verify-Npm -command $command -package $package -f to install." -ForegroundColor Red;
    return $false;
  } else {
    Write-Host "$command missing! Attempting to install..." -ForegroundColor DarkYellow;
    npm install -g $package;
    return Verify-NPM -command $command -package $package;
  }
} else {
  Write-Host "$command installed." -ForegroundColor DarkGreen;
  return $true;
}
