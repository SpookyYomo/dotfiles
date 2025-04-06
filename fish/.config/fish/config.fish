# Set XDG environment variables in a file for ease of tracking
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state

set -gx ANDROID_HOME "$XDG_DATA_HOME"/android
set -gx HISTFILE "$XDG_STATE_HOME"/bash/history
set -gx BASH_COMPLETION_USER_FILE "$XDG_CONFIG_HOME"/bash-completion/bash_completion
set -gx RUSTUP_HOME "$XDG_DATA_HOME"/rustup
set -gx CARGO_HOME "$XDG_DATA_HOME"/cargo
set -gx GNUPGHOME "$XDG_DATA_HOME"/gnupg
set -gx GTK2_RC_FILES "$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
set -gx IPYTHONDIR "$XDG_CONFIG_HOME"/ipython
set -gx JUPYTER_CONFIG_DIR "$XDG_CONFIG_HOME"/jupyter
set -gx LESSHISTFILE "$XDG_CACHE_HOME"/less/history
set -gx MATHEMATICA_USERBASE "$XDG_CONFIG_HOME"/mathematica
set -gx TERMINFO "$XDG_DATA_HOME"/terminfo
set -gx TERMINFO_DIRS "$XDG_DATA_HOME"/terminfo /usr/share/terminfo
set -gx PYENV_ROOT "$XDG_DATA_HOME"/pyenv
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx TEXMFVAR "$XDG_CACHE_HOME"/texlive/texmf-var
set -gx DOCKER_HOST unix://"$XDG_RUNTIME_DIR"/docker.sock
set -gx DOCKER_CONFIG "$XDG_CONFIG_HOME"/docker
set -gx MACHINE_STORAGE_PATH "$XDG_DATA_HOME"/docker-machine
set -gx WGETRC "$XDG_CONFIG_HOME"/wgetrc
set -gx CUDA_CACHE_PATH "$XDG_CACHE_HOME"/nv
# set -gx XAUTHORITY "$XDG_RUNTIME_DIR"/Xauthority
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
alias yarn='yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config'
alias svn='svn --config-dir "$XDG_CONFIG_HOME"/subversion'

# ruby-bundler (relevant only due to Jekyll)
set -gx BUNDLE_USER_CACHE $XDG_CACHE_HOME/bundle
set -gx BUNDLE_USER_CONFIG $XDG_CONFIG_HOME/bundle/config
set -gx BUNDLE_USER_PLUGIN $XDG_DATA_HOME/bundle

# SSH askpass preferences
set -gx GIT_ASKPASS ksshaskpass
set -gx SSH_ASKPASS ksshaskpass
set -gx SSH_ASKPASS_REQUIRE prefer

set -gx EDITOR nvim
set -gx GIT_EDITOR nvim
set -gx TMPDIR "/dev/shm"

# Start of normal rc
if status is-interactive
    # Commands to run in interactive sessions can go here
    alias cp='cp -i'
    alias rm='rm -i --one-file-system'
    alias l='/usr/bin/ls --color=auto'
    alias ls='exa -la --colour=always --group-directories-first --icons'

    alias git='NVIM_APPNAME=nvim_config/AstroNvim /usr/bin/git'
    alias rg='rg --hyperlink-format=kitty'

    alias urldecode decode

    alias logout='qdbus6 org.kde.Shutdown /Shutdown org.kde.Shutdown.logout'
    alias kdesu='/usr/lib/kf6/kdesu'

    alias icat='kitten icat'
    abbr --add kssh 'kitty +kitten ssh --kitten="askpass=native" --kitten="login_shell=fish"'

    starship init fish | source
    # fish transient prompt for fish
    enable_transience
end

# stackoverflow.com/a/23233524 for fish syntax
# https://wiki.archlinux.org/title/SSH_keys#Forwarding_ssh-agent for setting
if [ ( count $SSH_CONNECTION ) -le 0 ]
    set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
end

# python build
set -gx PYTHON_CONFIGURE_OPTS "--enable-shared --enable-optimizations --with-lto"
set -gx PYTHON_CFLAGS "-march=native -mtune=native"
# pyenv
pyenv init - | source
pyenv init --path | source
status --is-interactive; and pyenv virtualenv-init - | source

# zoxide
zoxide init fish | source

# starship
function starship_transient_prompt_func
    echo -n '[' (prompt_pwd) '] '
    # echo -n '[' $(basename $(dirname $PWD))/$(basename $PWD) '] '
    starship module character
end

# pnpm
set -gx PNPM_HOME "/home/thormund/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

# Nvim configs source: https://gist.github.com/elijahmanor/b279553c0132bfad7eae23e34ceb593b
# Utilises $NVIM_APPNAME to run nvim; searches for config files in $XDG_CONFIG_HOME/$NVIM_APPNAME
function nvim-astro
    # attempting to use folders under XDG_CONFIG_HOME
    env NVIM_APPNAME=nvim_config/AstroNvim nvim $argv
end

bind \ca 'nvims' execute
bind \eg 'git status' execute
bind \ey 'NVIM_APPNAME=nvim_config/AstroNvim yazi_wrap'
