if (Verify-Command "mongod") {
  Write-Host "mongodb $(mongod --version | grep 'db version')" -ForegroundColor Green;
} else {
  if ($(Verify-Bin "mongodb") -eq $False) {
    Write-Host "mongodb missing. Try https://www.mongodb.com/download-center#community" -ForegroundColor Yellow;
  } else {
    Mongo-Init;
  }
}
