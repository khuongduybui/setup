$code = Test-Path "$env:programfiles (x86)/Microsoft VS Code/bin/code.cmd";
if ($code -eq $true) {
	$path = Resolve-Path "$env:programfiles (x86)/Microsoft VS Code/bin";
	. "$path/code" $args;
} else {
	notepad $args;
}
