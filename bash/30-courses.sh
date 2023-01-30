# shortcuts for navigating to courses

# courses are in ~/courses/<dept><course number>
# e.g. ~/courses/eecs280

# navigate to a by dept and course number (removes spaces) (case insensitive)
# c eecs 280
# c EECS 280
# c eecs280
# c EECS280
function c() {
  cd ~/courses/$(echo $1$2 | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]//g')
}

function cl() {
  ls ~/courses | grep -E '^[a-z]{1,10}[0-9]{3}$' | sed 's/\([a-z]\{1,10\}\)\([0-9]\{3\}\)/\1 \2/' | tr '[:lower:]' '[:upper:]'
}

function mkcourse() {
  mkdir -p ~/courses/$(echo $1$2 | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]//g')
}

function projects() {
  olddir="$(pwd)"
  pushd ~/projects > /dev/null
  echo '`popd` when finished to return to' $olddir
}
