function odin
	set f (curl "http://localhost:2009" -I 2>/dev/null)
	if test -z "$f"
		set_color $fish_color_error
		echo "ERRROR: cannot connect to http://localhost:2009."
		return
	end
	set type "Credential"
	if test (count $argv) = 2
		set type "$argv[2]"
	end
	GET "http://localhost:2009/query?Operation=retrieve&ContentType=JSON&material.materialName=$argv[1]&material.materialType=$type" | tr '{},' '\n\n\n' | sed -n 's/"materialData":"\(.*\)"/\1/p' | base64 -di
end
