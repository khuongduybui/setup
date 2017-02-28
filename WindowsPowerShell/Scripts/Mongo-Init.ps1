$service = Get-Service -name 'mongodb' 2>$null
if ($service -eq $null) {
  if (Verify-Command "mongod") {
    Write-Host "mongodb $(mongod --version | grep 'db version')" -ForegroundColor Green;
    Write-Host "Install service as needed:";
    Write-Host 'mongod --dbpath="Z:\db\data" --logpath="Z:\db\logs" --install' -ForegroundColor Blue;
  } else {
    if ($(Verify-Bin "mongodb") -eq $False) {
      Write-Host "mongodb missing. Try https://www.mongodb.com/download-center#community" -ForegroundColor Yellow;
    } else {
      Mongo-Init;
    }
  }
} else {
  if ($service.Status -eq 'running') {
    Write-Host "Service $($service.displayName) is $($service.Status)" -ForegroundColor Green;
  } else {
    Write-Host "Service $($service.displayName) is $($service.Status), starting..." -ForegroundColor Yellow;
    Start-Service -name "MongoDB";
    Mongo-Init;
  }
}
