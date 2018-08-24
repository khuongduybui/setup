param([switch] $f);

$path = "~\Programs\sysinternals";
if (Test-Path $path) {
  Verify-Path $path;
  Write-Host "Sysinternals Suite installed." -ForegroundColor Green;
} else {
  if ($f -eq $false) {
    Write-Host "Sysinernals Suite missing! Run SysInternals-Init -f to install" -ForegroundColor Red;
  } else {
    Write-Host "Sysinternals Suite missing! Attempting to install..." -ForegroundColor Yellow;
    mkdir $path;
    wget "http://download.sysinternals.com/files/SysinternalsSuite.zip" -OutFile $path\suite.zip;
    unzip $path\suite.zip $path;
    rm $path\suite.zip;
    SysInternals-Init;
  }
}
