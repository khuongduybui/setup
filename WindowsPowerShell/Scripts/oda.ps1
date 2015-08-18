param([string] $App);

$path = "~\OneDrive\Essentials\AppData\$App"
if ((Test-Path $path) -eq $false) {
	Write-Host "$App not found." -ForegroundColor Red;
} else {
	cd $(Resolve-Path $path);
}
