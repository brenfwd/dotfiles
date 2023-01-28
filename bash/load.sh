# Entrypoint for bash customization

# ignore non-interactive sessions
case $- in
  *i*) ;;
  *) return;;
esac

# get the path to this script
script_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# load all files in the bash directory starting with a number
for file in "$script_path"/[0-9]*.sh; do
  source "$file"
done
