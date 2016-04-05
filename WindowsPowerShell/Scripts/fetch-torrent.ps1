if ((Test-Path "~/setup/wincron") -eq $True) {
    if ((Verify-Command "node") -eq $True) {
        node (Resolve-Path "~/setup/wincron")
    } else {
        Write-Host "Error: node not found." -ForegroundColor Red
    }
} else {
    Write-Host "Error: ~/setup/wincron not found." -ForegroundColor Red
}
