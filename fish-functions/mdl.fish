function mdl
	echo "\\\\$argv[1]\\durin_logs"
	sudo mount -t cifs "\\\\$argv[1]\\durin_logs" . -o username=ANT\\$USER,noexec
end
