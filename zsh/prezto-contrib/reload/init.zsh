# From oh-my-zsh: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/zsh_reload/zsh_reload.plugin.zsh
function src {
    local cache="${XDG_CACHE_HOME:-$HOME/.cache}/prezto"
    autoload -U compinit zrecompile
    compinit -i -d "$cache/zcomp-$HOST"

    for f in ${ZDOTDIR:-~}/.zshrc "$cache/zcomp-$HOST"; do
        zrecompile -p $f && command rm -f $f.zwc.old
    done

    # Use $SHELL if it's available and a zsh shell
    local shell="$ZSH_ARGZERO"
    if [[ "${${SHELL:t}#-}" = zsh ]]; then
        shell="$SHELL"
    fi

    # Remove leading dash if login shell and run accordingly
    if [[ "${shell:0:1}" = "-" ]]; then
        exec -l "${shell#-}"
    else
        exec "$shell"
    fi
}
