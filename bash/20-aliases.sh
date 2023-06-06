# Aliases for bash

# if exa is installed, use it for ls
if command -v exa >/dev/null 2>&1; then
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

# some convenient aliases

alias ..='cd ..'
alias ...='cd ../..'

# git aliases are now in 41-git-functions.sh

# python

alias py='python3'

# administation

alias rm='rm -v'

alias dush='du -sh'
alias dusha='du -sh *'
alias dushd='du -sh */'

alias dfh='df -h'
