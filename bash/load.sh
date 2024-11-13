# Entrypoint for bash customization

# ignore non-interactive sessions
case $- in
  *i*) ;;
  *) return;;
esac

# get the path to this script
script_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Ensure `bun` is available before continuing
# if ! command -v bun &> /dev/null; then
#   echo "Please install \`bun\` to use the dotfiles bash customization"
#   echo "https://bun.sh/"
#   alias ls='ls --color=auto'
#   alias la='ls -A'
#   alias ll='ls -alF'
#   alias l='ls -CF'
#   alias ..='cd ..'
#   alias ...='cd ../..'
#   return
# fi

# load all files in the bash directory starting with a number
for file in "$script_path"/[0-9]*.sh; do
  source "$file"
done
