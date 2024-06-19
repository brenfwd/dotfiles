# Check for updates to this dotfiles repo

# Get path to this script
script_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Get git status
git -C "$script_path" fetch &> /dev/null
git -C "$script_path" status -uno &> /dev/null

# Get git repo directory
repo_dir=$(git -C "$script_path" rev-parse --show-toplevel)

# Check if there are any changes
if [ $? -eq 0 ]; then
  echo "There are updates available for the dotfiles repo"
  echo "Run \`cd $repo_dir && git pull\` to update"
  echo
fi
