function x-init
	set_color $fish_color_operator; echo Launching X-Server; set_color normal
  if test -x $W/AppData/Local/Microsoft/WindowsApps/x410.exe
    if /mnt/c/WINDOWS/system32/tasklist.exe | grep -iq x410
      echo x410 already loaded.
    else
		  /mnt/c/WINDOWS/system32/cmd.exe /C x410.exe /wm
		  echo x410 loaded.
    end
	else
		echo x410 not found.
	end
end
