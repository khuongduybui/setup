if (Test-Path ~\Programs\portableapps\xampp\App\xampp) {
  $phpPath = Resolve-Path "~\Programs\portableapps\xampp\App\xampp\php";
  $mysqlPath = Resolve-Path "~\Programs\portableapps\xampp\App\xampp\mysql\bin";
  $env:Path = "$env:Path;$phpPath;$mysqlPath";
  php -v | grep "PHP" | grep "built" | Write-Host -ForegroundColor DarkGreen;
  mysql --version | Write-Host -ForegroundColor DarkGreen;
} else {
  Write-Host "XAMPP misssing!" -ForegroundColor Red;
}
