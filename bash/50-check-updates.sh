# Get path to this script
script_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Print without newline
printf "Checking for dotfile updates..."

# Fetch updates from the remote repository
git -C "$script_path" fetch &> /dev/null

# Clear line
printf "\33[2K\r"

# Get the repository directory
repo_dir=$(git -C "$script_path" rev-parse --show-toplevel)

# Check for updates by comparing local and remote branches
if git -C "$repo_dir" status -uno | grep -q 'Your branch is behind'; then
  echo "There are updates available for the dotfiles repo!"
  echo "Run \`cd $repo_dir && git pull\` to update, then restart your shell."
  echo
fi
