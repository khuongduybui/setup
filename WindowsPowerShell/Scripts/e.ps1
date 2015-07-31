$code = Test-Path "~/AppData/Local/Code/bin/code.cmd";
if ($code -eq $true) {
	$path = Resolve-Path "~/AppData/Local/Code/bin";
	. "$path/code" $args;
} else {
	nodepad $args;
}
