# Miscellaneus functions

# Base64 decode
function b64d() {
    if [[ -n "$1" ]]; then
        echo "$1" | base64 -d
        return $?
    fi
    return 1
}

# Base64 encode
function b64e() {
    if [[ -n "$1" ]]; then
        echo "$1" | base64
        return $?
    fi
    return 1
}

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
