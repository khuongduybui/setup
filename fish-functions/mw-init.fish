# Defined in /var/folders/dz/y2q7pw153pz7gm62rj5n25_9qzr_wy/T//fish.2iEKY4/mw-init.fish @ line 2
function mw-init
	if __is_mac
		mwinit -k ~/.ssh/primary.pem.pub
	else
		mwinit -o --no-update-check -k ~/.ssh/primary.pem.pub
	end
end
