function nvims
    set -l items default AstroNvim
    set -l config (printf "%s\n" $items | fzf --prompt=" Neovim Config 󰄾 " --height=~50% --layout=reverse --border --exit-0)
    if [ -z $config ]
        echo "Nothing selected"
        # early exit
        return 0
    else if [ $config = "default" ]
        set -x NVIM_APPNAME
    else
        set -x NVIM_APPNAME "nvim_config/$config"
    end

    if test -z "$argv"
        commandline -i "env NVIM_APPNAME=$NVIM_APPNAME nvim "
    else
        commandline -i "env NVIM_APPNAME=$NVIM_APPNAME nvim"
    end
end
