$XServerPath = $null;
if (Test-Path "~\Programs\Xming") {
    $XServerPath = Resolve-Path "~\Programs\Xming\Xming.exe";
}
if (Test-Path "$env:ProgramFiles\Xming") {
    $XServerPath = Resolve-Path "$env:ProgramFiles\Xming\Xming.exe";
}
if (Test-Path "~\Programs\VcXsrv") {
    $XServerPath = Resolve-Path "~\Programs\VcXsrv\VcXsrv.exe";
}
if (Test-Path "$env:ProgramFiles\VcXsrv") {
    $XServerPath = Resolve-Path "$env:ProgramFiles\VcXsrv\VcXsrv.exe";
}
if ($XServerPath -ne $null) {
    $xming = Get-Process -Name 'Xming' 2>$null;
    $vcxsrv = Get-Process -Name 'VcXsrv' 2>$null;
    if ($xming -eq $null -and $vcxsrv -eq $null) {
        Start-Process $XServerPath -ArgumentList (':0', '-ac', '-terminate', '-lesspointer', '-multiwindow', '-clipboard', '-wgl', '-resize', '-nolisten', 'inet6');
    }
    $env:DISPLAY='localhost:0';
    Write-Output "$XServerPath loaded.";
}
