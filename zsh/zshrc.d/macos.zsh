[[ -n $INIT_MACOS ]] || return

# Use GNU commands
path=(/usr/local/opt/*/libexec/gnubin $path)
