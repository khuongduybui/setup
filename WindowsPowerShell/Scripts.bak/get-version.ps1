param($module);

$path = Resolve-Path(".\node_modules\$module\package.json");
Get-Content "$path" | grep '"version": "';
