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

    fzf --fish | source
    starship init fish | source
    # fish transient prompt for fish
    enable_transience
end

# stackoverflow.com/a/23233524 for fish syntax
# https://wiki.archlinux.org/title/SSH_keys#Forwarding_ssh-agent for setting
if [ ( count $SSH_CONNECTION ) -le 0 ]
    set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
end

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
set -gx PNPM_HOME $HOME/.local/share/pnpm
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

# Nvim configs source: https://gist.github.com/elijahmanor/b279553c0132bfad7eae23e34ceb593b
# Utilises $NVIM_APPNAME to run nvim; searches for config files in $XDG_CONFIG_HOME/$NVIM_APPNAME
function nvim-astro
    # attempting to use folders under XDG_CONFIG_HOME
    env NVIM_APPNAME=nvim_config/AstroNvim nvim $argv
end

bind \ca beginning-of-buffer 'nvims' execute
bind \eg 'git status' execute
bind \ey 'NVIM_APPNAME=nvim_config/AstroNvim yazi_wrap'
