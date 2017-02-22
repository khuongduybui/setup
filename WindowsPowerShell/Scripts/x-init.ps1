$XmingPath = $null;
if (Test-Path "$env:ProgramFiles\Xming") {
    $XmingPath = Resolve-Path "$env:ProgramFiles\Xming";
}
if (Test-Path "~\Programs\Xming") {
    $XmingPath = Resolve-Path "~\Programs\Xming";
}
if ($XmingPath -ne $null) {
    $xming = Get-Process -Name 'Xming' 2>$null;
    if ($xming -eq $null) {
        Start-Process "$XmingPath\Xming.exe" -ArgumentList (':0', '-resize', '-clipboard', '-multiwindow', '-nolisten', 'inet6');
    }
    $env:DISPLAY='localhost:0';
    Write-Output 'X-host loaded.';
}
