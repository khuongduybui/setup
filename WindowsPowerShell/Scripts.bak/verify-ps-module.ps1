param($module, $alias, $main)

$check = Get-InstalledModule -name $module -ErrorAction SilentlyContinue;
if ($check -eq $null) {
	Write-Host "$module missing! Attempting to install... " -ForegroundColor Yellow -NoNewLine;
	Import-Module PowerShellGet;
	PowershellGet\Install-Module $module -Force;
	Verify-PS-Module $module $alias $name;
} else {
	Write-Host "$module loaded." -ForegroundColor Green;
}
