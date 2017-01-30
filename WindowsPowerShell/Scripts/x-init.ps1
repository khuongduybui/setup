if (Test-Path "$env:ProgramFiles\Xming") {
    $xming = Get-Process -Name 'Xming' 2>$null;
    if ($xming -eq $null) {
        Start-Process "$env:ProgramFiles\Xming\Xming.exe" -ArgumentList (':0', '-resize', '-clipboard', '-multiwindow', '-nolisten', 'inet6');
    }
    $env:DISPLAY='localhost:0';
    Write-Output 'X-host loaded.';
}
