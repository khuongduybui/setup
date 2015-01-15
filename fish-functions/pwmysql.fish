function pwmysql
	set e (pwe)
	set pMaterial (grep -e '<root source="odin"' apollo-overrides/$e/mysql-config/server.xml | tr '< >' '\n' | grep materialset | sed -e 's/materialset="//' -e 's/"//' -)
	set pw (odin $pMaterial)
	set db (grep -e '<database name=' apollo-overrides/$e/mysql-config/server.xml | tr '< >' '\n' | grep name | sed -e 's/name="//' -e 's/"//' -)
	ape mysql -S /apollo/env/$e/var/mysql/state/mysql.sock -u root --password=$pw $db
end
