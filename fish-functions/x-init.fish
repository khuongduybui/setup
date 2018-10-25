# Defined in /tmp/fish.VK565n/x-init.fish @ line 2
function x-init
	set_color $fish_color_operator; echo Launching X-Server; set_color normal
  if test -x $W/AppData/Local/Microsoft/WindowsApps/x410.exe
    if /mnt/c/WINDOWS/system32/tasklist.exe | grep -iq x410
      echo x410 already loaded.
    else
		  nohup /mnt/c/WINDOWS/system32/cmd.exe /C x410.exe /wm > (mktemp) &
		  echo x410 loaded.
    end
	else
		echo x410 not found.
	end
end
