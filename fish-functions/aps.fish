function aps
	if test -d /apollo/env/envImprovement
		if test -f ~/.zshrc
			mv ~/.zshrc ~/.zshrc.bak
		end
		ln -s /apollo/env/envImprovement/var/zshrc ~/.zshrc
		/apollo/env/envImprovement/bin/zsh -i
		rm ~/.zshrc
		mv ~/.zshrc.bak ~/.zshrc
	end
end
