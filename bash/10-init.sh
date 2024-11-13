# Initial customizations for bash

# ignore duplicate lines and lines with leading spaces
HISTCONTROL=ignoreboth

# set history file size
HISTSIZE=100000
HISTFILESIZE=100000

shopt -s histappend # append to history instead of overwriting it

# enable window resizing
shopt -s checkwinsize

# use lesspipe if available
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable bash completion if available
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# enable ~/.local/bin PATH entry
export PATH="$HOME/.local/bin:$PATH"

# enable dotfiles bin PATH entry
export PATH="$HOME/dotfiles/bin:$PATH"

# enable gpg to use current tty for git commit signing
export GPG_TTY=$(tty)

# set prompt
export PROMPT_COMMAND='PS1=$(dotfiles-ps1-v2)'
