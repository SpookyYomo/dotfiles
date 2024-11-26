init: prompt
	stow AstroNvim_config
	stow yazi
	sudo stow --target=/ Firefox
	stow fish

fish_fn:
	# We create completions for functions by copying and sed
	# See https://fishshell.com/docs/current/completions.html
	sed 's/complete -c fd /complete -c ffd /' /usr/share/fish/vendor_completions.d/fd.fish > ffd.fish
	sed 's/complete -c rg /complete -c frg /' /usr/share/fish/vendor_completions.d/rg.fish > frg.fish

prompt:
	@echo -n "Stowing may be destructive if you do not know what you are doing! Continue? [y/N]" && read and && [ $${and:-N} = y ]
