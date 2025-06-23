init: prompt
	stow AstroNvim_config
	stow yazi
	sudo stow --target=/ Firefox
	stow fish
	stow starship
	stow git
	stow kitty
	systemd_user

fish_fn:
	# We create completions for functions by copying and sed
	# See https://fishshell.com/docs/current/completions.html
	sed 's/complete -c fd /complete -c ffd /' /usr/share/fish/vendor_completions.d/fd.fish > $(XDG_CONFIG_HOME)/fish/completions/ffd.fish
	sed 's/complete -c rg /complete -c frg /' /usr/share/fish/vendor_completions.d/rg.fish > $(XDG_CONFIG_HOME)/fish/completions/frg.fish

firefox_user:
	# This populates from our user-written user.js into a user.js that is
	# inherited across all profiles.
	sed 's/user_pref(/defaultPref(/' Firefox_user/user.js | sudo tee /usr/lib/firefox/firefox.cfg 1> /dev/null

systemd_user:
	@echo -n "Overwrite systemd configs?" && read and && [ $${and:-N} = y ]
	stow systemd
	stow -D systemd

yazi:
	echo "Updating yazi pkgs..."
	ya pkg update

yazi_new:
	echo "Installing yazi pkgs..."
	ya pkg install yazi-rs/plugins:git
	ya pkg install Reledia/hexyl

prompt:
	@echo -n "Stowing may be destructive if you do not know what you are doing! Continue? [y/N]" && read and && [ $${and:-N} = y ]
