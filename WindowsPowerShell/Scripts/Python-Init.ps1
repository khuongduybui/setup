param([string] $Version)

if ((Verify-Command 'python') -eq $False) {
  if ($Version -eq '') {
    $Version = 2
  }

  Verify-Path "~/programs/Python$Version*";
  Verify-Path "~/programs/Python$Version*/Scripts";
  Python-Init;
} else {
  python -V;
  pip -V;
  easy_install --version;
}
