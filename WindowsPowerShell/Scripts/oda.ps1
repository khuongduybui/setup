param([switch] $f, [string] $App);

$path = "$OneDrive\Essentials\AppData\$App"
if (Test-Path $path) {
	cd $path;
	if ($f -eq $True) {
		$follow = Get-Content "*where.txt"
		if (Test-Path $follow) {
			cd $follow;
		}
	}
} else {
	Write-Host "$App not found." -ForegroundColor Red;
}