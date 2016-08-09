try {
  Write-Host "nodist $(nodist --version)" -ForegroundColor Green;
  try {
    Write-Host "node $(node --version)" -ForegroundColor Green;
  } catch {
    Write-Host "node missing. Attempting to install..." -ForegroundColor Yellow;
    nodist latest;
    Node-Init;
  }
} catch {
  if ($(Verify-Bin "nodist") -eq $False) {
    Write-Host "nodist missing. Try https://github.com/marcelklehr/nodist/releases/latest" -ForegroundColor Yellow;
  } else {
    Node-Init;
  }
}
