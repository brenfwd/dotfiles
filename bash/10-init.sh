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

# set prompt
export PS1="\[\033[38;5;243m\]\h\[$(tput sgr0)\] \[$(tput bold)\]\W\[$(tput sgr0)\]\[\033[38;5;46m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;14m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

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

# enable gpg to use current tty for git commit signing
export GPG_TTY=$(tty)
