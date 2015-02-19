try {
  $nodeCmd = Get-Command "node" -ErrorAction Stop;
  if ($nodeCmd -ne $null) {
    Write-Host "node installed." -ForegroundColor DarkGreen;
  } else {
    Write-Host "node missing! Attempting to install..." -ForegroundColor Yellow;
    choco install nodejs.install
  }
} catch {
  Write-Host "node missing! Attempting to install..." -ForegroundColor Yellow;
  choco install nodejs.install
}
