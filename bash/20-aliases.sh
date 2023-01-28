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

# if bat is installed, use it for cat
if command -v bat >/dev/null 2>&1; then
  alias cat='bat'
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

# git aliases

alias g='git'
alias gs='git status'
alias ga='git add -v'
alias gaa='git add -Av'
alias gi='git init'
alias gc='git commit'
alias gcm='git commit -m'

# python

alias py='python3'

# administation

alias rm='rm -iv'

alias dush='du -sh'
alias dusha='du -sh *'
alias dushd='du -sh */'

alias dfh='df -h'
