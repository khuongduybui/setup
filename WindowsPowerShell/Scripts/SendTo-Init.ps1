pushd;
cd ~\OneDrive\Essentials\CustomSendTo;
$files = Get-ChildItem -force | Where-Object {$_.NAME -match "\.lnk$"};
cd ~;
foreach ($file in $files) {
  $f = $file.Name;
  if (Test-Path ~\AppData\Roaming\Microsoft\Windows\SendTo\$f) {
    #don't do anything
  } else {
    cp ~\OneDrive\Essentials\CustomSendTo\$f ~\AppData\Roaming\Microsoft\Windows\SendTo;
  }
}
popd;
