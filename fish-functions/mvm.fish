function mvm
	if __is_mac
		sudo mount -t nfs duybui-vm.aka.amazon.com:/rhel5pdi/workplace/duybui /workplace/duybui;
		sudo mount -t nfs duybui-vm.aka.amazon.com:/rhel5pdi/apollo /apollo;
	else	
		sudo mount -t nfs -o proto=tcp,port=2049 duybui-vm.aka.amazon.com:/workplace/duybui /home/duybui/code;
		sudo mount -t nfs -o proto=tcp,port=2049 duybui-vm.aka.amazon.com:/apollo /apollo;
	end
end