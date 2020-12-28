# Miscellaneus functions

# Create a temporary directory and go there
function mkdt() {
    local dir
    dir=$(mktemp -d)
    cd $dir
}

# External ip
function ext-ip() {
    if (( ${+commands[dig]} )); then
        dig +short myip.opendns.com @resolver1.opendns.com
        return $?
    else
        print "dig not installed" >&2
        return 1
    fi
}
