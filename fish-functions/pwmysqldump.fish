function pwmysqldump
	set e (pwe)
	set pMaterial (grep -e '<root source="odin"' apollo-overrides/$e/mysql-config/server.xml | tr '< >' '\n' | grep materialset | sed -e 's/materialset="//' -e 's/"//' -)
	set pw (odin $pMaterial)
	ape mysqldump -S /apollo/env/$e/var/mysql/state/mysql.sock -u root --password=$pw $argv
end
