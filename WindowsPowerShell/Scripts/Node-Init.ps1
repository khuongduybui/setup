$env:NODIST_PREFIX = Resolve-Path("~/Programs/nodist");
if (Verify-Command "nodist") {
  Write-Output "nodist $(nodist --version)";
  Write-Output "node $(node --version)";
} else {
  if ($(Verify-Bin "nodist") -eq $False) {
    Write-Error "nodist missing. Try https://github.com/marcelklehr/nodist/releases/latest";
  } else {
    Node-Init;
  }
}
