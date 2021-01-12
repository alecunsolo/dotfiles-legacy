#
# Provides oh-my-zsh Git aliases and functions.
# see:
#   - https://github.com/sorin-ionescu/prezto/tree/master/modules/git
#   - https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh
#

# Return if requirements are not found.
if (( ! $+commands[git] )); then
  return 1
fi

# Load dependencies.
pmodload 'git'

# Source module files.
source "${0:h}/alias.zsh"
