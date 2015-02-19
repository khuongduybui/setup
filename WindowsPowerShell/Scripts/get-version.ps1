param($module);

$path = Resolve-Path(".\node_modules\$module\package.json");
cat "$path" | grep '"version": "';
