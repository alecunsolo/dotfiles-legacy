[[ -n $INIT_TMUX ]] || return
# Start or attach to a tmux session with the given name ('main' as default)
function txa() {
    tmux new-session -A -s ${1:-main}
}

