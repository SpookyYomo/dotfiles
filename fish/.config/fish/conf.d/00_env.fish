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
set -gx PARALLEL_HOME "$XDG_CONFIG_HOME"/parallel
# set -gx XAUTHORITY "$XDG_RUNTIME_DIR"/Xauthority
set -gx PASSWORD_STORE_DIR "$XDG_DATA_HOME"/pass

# pairing with XDG env-vars
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
alias yarn='yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config'
alias svn='svn --config-dir "$XDG_CONFIG_HOME"/subversion'

# SSH askpass preferences
set -gx GIT_ASKPASS ksshaskpass
set -gx SSH_ASKPASS ksshaskpass
set -gx SSH_ASKPASS_REQUIRE prefer

# Editors
set -gx PAGER less
set -gx EDITOR nvim
set -gx GIT_EDITOR nvim

# Firefox
set -gx GTK_USE_PORTAL 1
set -gx TMPDIR "/dev/shm"

# Python build
set -gx PYTHON_CONFIGURE_OPTS "--enable-shared --enable-optimizations --with-lto"
set -gx PYTHON_CFLAGS "-march=native -mtune=native"

# Rust build
set -gx RUSTFLAGS "-C target-cpu=native"

# Caching build output (Sccache)
set -gx RUSTC_WRAPPER sccache
set -gx SCCACHE_DIR "$XDG_CACHE_HOME"/sccache
