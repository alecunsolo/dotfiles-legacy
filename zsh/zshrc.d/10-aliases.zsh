
# Common aliases
alias grep='grep --color=auto'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias sysdreload='systemctl --user daemon-reload'
alias find='noglob find'
alias sudo='sudo '
alias vzsh="vim ~/.zshrc"
alias gfop="git fetch origin --prune"

# Add alias to prune local branches that where merged
alias gplb="git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -d"

# Global aliases
alias -g L=' | less'
alias -g B=' | bat'
alias -g BY=' | bat -l yaml'

# Brew aliases  
if (( $+commands[brew] )); then
    alias b='brew'
    alias bco='brew outdated --cask'
    alias bi='brew info'
    alias bs='brew search'
    alias bins='brew install'
    alias bci='brew info --cask'
    alias bcins='brew install --cask'
fi

