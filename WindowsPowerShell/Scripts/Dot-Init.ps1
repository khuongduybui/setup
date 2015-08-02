pushd;
cd ~\OneDrive\Essentials;
$files = Get-ChildItem -force | Where-Object {$_.NAME -match "(^[\._])|(\.js$)"};
cd ~;
foreach ($file in $files) {
	$f = $file.Name;
	if (Test-Path ~\$f) {
		#don't do anything
	} else {
		if ($file.Attributes -match "Directory") {
			mklink /D $f OneDrive\Essentials\$f;
		} else {
			mklink $f OneDrive\Essentials\$f;
		}
	}
}
cd ~\OneDrive\Essentials\AppData;
$files = Get-ChildItem;
foreach ($file in $files) {
	$f = $file.Name;
	if (Test-Path $f\where.txt) {
		$content = [IO.File]::ReadAllText($(Resolve-Path("~\OneDrive\Essentials\AppData\$f\where.txt")))
		if (Test-Path $content) {
			$content = Resolve-Path $content

			$children = Get-ChildItem -force "~\OneDrive\Essentials\AppData\$f" | Where-Object {$_.NAME -match "[^(^where.txt$)]"};
			cd ~;
			foreach ($child in $children) {
				$file = $child.Name;
				if (Test-Path $content\$file) {
					if ($(Get-Item $(Resolve-Path $content\$file)).Attributes -band [IO.FileAttributes]::ReparsePoint) {
						#don't do anything
					} else {
						mv $content\$file $content\$file.bak
					}
				}

				if (Test-Path $content\$file) {
					#don't do anything
				} else {
					$target = Resolve-Path ~\OneDrive\Essentials\AppData\$f\$file
					if ($child.Attributes -match "Directory") {
						mklink /D $content\$file $target;
					} else {
						mklink $content\$file $target;
					}
				}
			}
		}
	}
}
popd;
