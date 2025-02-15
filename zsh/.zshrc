# Sourced on every interactive shell

# beeping is annoying
unsetopt beep

# Save most-recent X lines
HISTSIZE=100000
SAVEHIST=100000
HISTFILE="$HOME/.zsh_history"
# share history between sessions
setopt sharehistory
# save each entry to history (as opposed to on shell exit)
setopt incappendhistory
# Delete old recorded entry if new entry is a duplicate.
setopt histignorealldups
setopt histignoredups
setopt histsavenodups
# Do not display a line previously found.
setopt histfindnodups
# disable saving commands starting with space to history
setopt histignorespace
# Remove superfluous blanks before recording entry.
setopt histreduceblanks
# autocd - if no executable named like that, cd into dir
setopt autocd

# enable directories stack
setopt autopushd           # Push the current directory visited on the stack.
setopt pushdignoredups    # Do not store duplicates in the stack.
setopt pushdsilent         # Do not print the directory stack after pushd or popd.

# Useful Functions
source "$ZDOTDIR/functions"

zsh_add_file "completions"
zsh_add_file "aliases"
zsh_add_file "gpg-agent"
zsh_add_file "vi-mode"

# other programs inits (lazy load where possible)
# keep this as an example for the future
# pyenv() {
#     unfunction "$0"
#     eval "$(pyenv init -)"
#     $0 "$@"
# }
# to record "cd" history, zoxide cannot be lazy
eval "$(zoxide init zsh)"
# enable asdf
. $HOME/.asdf/asdf.sh
# Hook direnv into your shell.
eval "$(direnv hook zsh)"

# broot
autoload -Uz br
export SCRAPI_MSALAUTH_USERNAME="kamil@cerebre.io"
export SCRAPI_SERVERURL="https://cerebre03.xom.cloud/" 


# source zsh plugins that vary by platform
# should be last
zsh_add_file "plugins"
eval "$(pyenv init -)"
# starship prompt. Should be very close to the end of the file
eval "$(starship init zsh)"
