if (Test-Path "C:\Program Files (x86)\Android\android-studio\sdk\tools") {
    $skdPath = Resolve-Path "C:\Program Files (x86)\Android\android-studio\sdk\tools";
    $platformPath = Resolve-Path "C:\Program Files (x86)\Android\android-studio\sdk\platform-tools";
    $env:Path = "$env:Path;$skdPath;$platformPath;";
    adb version | Write-Host -ForegroundColor DarkGreen;
} else {
    Write-Host "Android SDK missing!" -ForegroundColor Red;
}
