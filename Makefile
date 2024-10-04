init: prompt
	stow AstroNvim_config
	sudo stow --target=/ Firefox

prompt:
	@echo -n "Stowing may be destructive if you do not know what you are doing! Continue? [y/N]" && read and && [ $${and:-N} = y ]
