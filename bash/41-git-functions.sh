# Git aliases

alias gs='git status'
alias gaa='git add -Av'
alias gi='git init'
alias gcm='git commit -m'

# Git functions (more complex)

# Git commit "quick"
function gcq() {
  local files_added=$(git diff --cached --name-only --diff-filter=A | tr '\n' ',' | sed 's/,$//' | sed 's/,/, /')
  local files_deleted=$(git diff --cached --name-only --diff-filter=D | tr '\n' ',' | sed 's/,$//' | sed 's/,/, /')
  local files_modified=$(git diff --cached --name-only --diff-filter=M | tr '\n' ',' | sed 's/,$//' | sed 's/,/, /')

  if [ -n "$files_added" ]; then
    files_added="Added: $files_added"
  fi

  if [ -n "$files_deleted" ]; then
    files_deleted="Deleted: $files_deleted"
  fi

  if [ -n "$files_modified" ]; then
    files_modified="Modified: $files_modified"
  fi

  # join with semicolon, remove empty elements
  local message_parts=("$files_added" "$files_deleted" "$files_modified")
  local message=$(printf "%s;" "${message_parts[@]}" | sed 's/;;*/;/g' | sed 's/^;//' | sed 's/;$//' | sed 's/;/; /g')

  # properly escape quotes
  message=$(echo "$message" | sed 's/"/\\"/g')
  git commit -m "$message"
}

alias gpush='git push'
alias gpull='git pull'

alias checkpoint='gaa && gcq && git push'
alias gquick='gaa && gcq && git push'
