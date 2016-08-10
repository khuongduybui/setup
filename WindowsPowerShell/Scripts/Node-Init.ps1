if (Verify-Command "nodist") {
	Write-Host "nodist $(nodist --version)" -ForegroundColor Green;
  if (Verify-Command "node") {
    Write-Host "node $(node --version)" -ForegroundColor Green;
  } else {
    Write-Host "node missing. Attempting to install..." -ForegroundColor Yellow;
    nodist latest;
    Node-Init;
  }
} else {
  if ($(Verify-Bin "nodist") -eq $False) {
    Write-Host "nodist missing. Try https://github.com/marcelklehr/nodist/releases/latest" -ForegroundColor Yellow;
  } else {
    $env:NODIST_PREFIX = Resolve-Path("~/Programs/nodist");
    Node-Init;
  }
}
