# Return if requirements are not found.
if (( ! $+commands[fzf] )); then
    return 1
fi

# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
    export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"
if (( $+commands[fd] )); then
    typeset -xg FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude ".git"'
    # Use fd (https://github.com/sharkdp/fd) instead of the default find
    # command for listing path candidates.
    # - The first argument to the function ($1) is the base path to start traversal
    # - See the source code (completion.{bash,zsh}) for the details.
    function _fzf_compgen_path() {
        fd --hidden --follow --exclude ".git" . "$1"
    }

    # Use fd to generate the list for directory completion
    function _fzf_compgen_dir() {
        fd --type d --hidden --follow --exclude ".git" . "$1"
    }
fi

