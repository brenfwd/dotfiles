# Aliases for bash

# if exa is installed, use it for ls
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --time-style=long-iso --group-directories-first'
  alias la='ls -la'
  alias ll='ls -l'
  alias l='ls'
elif command -v exa >/dev/null 2>&1; then
  alias ls='exa --time-style=long-iso --group-directories-first'
  alias la='ls -la'
  alias ll='ls -l'
  alias l='ls'
else
  alias ls='ls --color=auto'
  alias la='ls -A'
  alias ll='ls -alF'
  alias l='ls -CF'
fi

# untar
alias untar='tar -xzvf'

# if bat is installed, use it for cat
if command -v batcat >/dev/null 2>&1; then
  alias cat='batcat'
fi

# use colorized tree
if command -v tree >/dev/null 2>&1; then
  alias tree='tree -C'
fi

# use colorized grep
if command -v grep >/dev/null 2>&1; then
  alias grep='grep --color=auto'
fi

# disable gdb startup noise
if command -v gdb >/dev/null 2>&1; then
  alias gdb='gdb -q'
fi

# some convenient aliases

alias ..='cd ..'
alias ...='cd ../..'

# python

alias py='python3'
alias python='python3'

# administation

alias rm='rm -v'
