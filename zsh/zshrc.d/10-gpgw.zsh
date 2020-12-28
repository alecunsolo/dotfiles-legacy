#!/usr/bin/env zsh

gpgw() {
    local subPath="$ZSH_CUSTOM/scripts"
    local sub="${1}" ; shift
    local func="$funcstack[1]"
    local subCmd="${subPath}/${func}_${sub}"

    if [[ -x "$subCmd" ]]; then
        "$subCmd" "${@}"
        return $?
    else
        printf '%s\n' "$func: Unknown sub-command '${sub}'." >&2
        return 1
    fi
}
