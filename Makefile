init: prompt
	stow AstroNvim_config

prompt:
	@echo -n "Stowing may be destructive if you do not know what you are doing! Continue? [y/N]" && read and && [ $${and:-N} = y ]
