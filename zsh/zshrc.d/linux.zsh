[[ -n $INIT_LINUX ]] || return

function disk-uuid() {
    [[ -z $1 ]] && echo "Must pass an argument" && return 1
    echo $(sudo blkid $1 -sUUID -ovalue)
}
