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
	$onedrive = resolve-path ~\OneDrive\Essentials\AppData\$f;
	if (Test-Path $onedrive\where.txt) {
		$content = [IO.File]::ReadAllText($(Resolve-Path("$onedrive\where.txt")))
		if (Test-Path $content) {
			$local = Resolve-Path $content

			$children = Get-ChildItem -force $onedrive | Where-Object {$_.NAME -match "[^(^where.txt$)]"};
			cd ~;
			foreach ($child in $children) {
				$file = $child.Name;
				if (Test-Path $local\$file) {
					if ($(Get-Item $(Resolve-Path $local\$file)).Attributes -band [IO.FileAttributes]::ReparsePoint) {
						#don't do anything
					} else {
						mv $local\$file $local\$file.bak
					}
				}

				if (Test-Path $local\$file) {
					#don't do anything
				} else {
					$target = Resolve-Path $onedrive\$file
					if ($child.Attributes -match "Directory") {
						mklink /D $local\$file $target;
					} else {
						mklink $local\$file $target;
					}
				}
			}
		}
	}
	if (Test-Path $onedrive\nowhere.txt) {
		$content = [IO.File]::ReadAllText($(Resolve-Path("$onedrive\nowhere.txt")))
		if (Test-Path $content) {
			$local = Resolve-Path $content

			$children = Get-ChildItem -force "$onedrive" | Where-Object {$_.NAME -match "[^(^where.txt$)]"};
			cd ~;
			foreach ($child in $children) {
				# $file = $child.Name;
				# if (Test-Path $local\$file) {
				# 	if ($(Get-Item $(Resolve-Path $onedrive\$file)).Attributes -band [IO.FileAttributes]::ReparsePoint) {
				# 		#don't do anything
				# 	} else {
				# 		mv $local\$file $local\$file.bak
				# 	}
				# }

				# if (Test-Path $local\$file) {
				# 	#don't do anything
				# } else {
				# 	$target = Resolve-Path $onedrive\$file
				# 	if ($child.Attributes -match "Directory") {
				# 		mklink /D $local\$file $target;
				# 	} else {
				# 		mklink $local\$file $target;
				# 	}
				# }
			}
		}
	}
}
popd;
