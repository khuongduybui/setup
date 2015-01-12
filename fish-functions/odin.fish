function odin
	echo $argv[1]
	GET "http://localhost:2009/query?Operation=retrieve&ContentType=JSON&material.materialName=$argv[1]&material.materialType=Credential" | tr '{},' '\n\n\n' | sed -n 's/"materialData":"\(.*\)"/\1/p' | base64 -di
end
