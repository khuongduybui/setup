pushd;

cd ~;
if __is_mac
	set sublimepath "./Library/Application Support/Sublime Text 3"
else
	set sublimepath "./config/sublime-text-3"
end

set filepath "$sublimepath/Installed Packages/Package Control.sublime-package"
test -f $filepath
or curl https://packagecontrol.io/Package%20Control.sublime-package > $filepath

set pcpath "$sublimepath/Packages/User/Package Control.sublime-settings"
test -f $pcpath
and mv $pcpath "$pcpath.bak"
ln -s ~/setup/sublime/Package\ Control.sublime-settings $pcpath

set slpath "$sublimepath/Packages/User/Preferences.sublime-settings"
test -f $slpath
and mv $slpath "$slpath.bak"
ln -s ~/setup/sublime/Preferences.sublime-settings $slpath

popd;
