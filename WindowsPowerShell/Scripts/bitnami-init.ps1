if (Test-Path ~\Programs\Bitnami\nginxstack*) {
  $phpPath = Resolve-Path "~\Programs\Bitnami\nginxstack*\php";
  $mysqlPath = Resolve-Path "~\Programs\Bitnami\nginxstack*\mysql\bin";
  $env:Path = "$env:Path;$phpPath;$mysqlPath";
  php -v | grep "PHP" | grep "built" | Write-Host -ForegroundColor DarkGreen;
  mysql --version | Write-Host -ForegroundColor DarkGreen;
} else {
  Write-Host "Bitnami misssing!" -ForegroundColor Red;
}
