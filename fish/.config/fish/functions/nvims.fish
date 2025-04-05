function nvims
    set -l items default AstroNvim
    set -l config (printf "%s\n" $items | fzf --prompt=" Neovim Config 󰄾 " --height=~50% --layout=reverse --border --exit-0)
    if [ -z $config ]
        echo "Nothing selected"
        return 0
    else if [ $config = "default" ]
        set -l config ""
        env NVIM_APPNAME= nvim $argv
    else
        # Add subfolder
        env NVIM_APPNAME=nvim_config/$config nvim $argv
    end
end
