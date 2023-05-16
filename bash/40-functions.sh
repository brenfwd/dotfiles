# epic functions for bash

# check if pandoc and xe-latex are installed
if  command -v pandoc >/dev/null 2>&1 && \
    command -v xelatex >/dev/null 2>&1 && \
    command -v cargo >/dev/null 2>&1 && \
    cargo watch --help >/dev/null 2>&1; then
  # convert markdown to pdf
  function md2pdf() {
    pandoc -f markdown+raw_tex --pdf-engine=xelatex -o $1.pdf $1.md
  }

  function md2pdfwatch() {
    cargo watch -C . -w "$1.md" -s "pandoc -f markdown+raw_tex --pdf-engine=xelatex -o \"$1.pdf\" \"$1.md\""
  }
fi

# create an array of temp dirs
tempdirs=()

function temp() {
  local tempdir=$(mktemp -d)
  tempdirs+=("$tempdir")
  pushd "$tempdir" >/dev/null
  echo "Entering temp dir: $tempdir"
  echo 'Use `poptemp` or `keeptemp` when done.'
}

function poptemp() {
  popd >/dev/null
  rm -rfv "${tempdirs[-1]}"
  unset tempdirs[-1]
}

function keeptemp() {
  popd >/dev/null
  echo "Keeping temp dir: ${tempdirs[-1]}"
  mv "${tempdirs[-1]}" "$HOME"
  unset tempdirs[-1]
}

function cleartemps() {
  for tempdir in "${tempdirs[@]}"; do
    rm -rfv "$tempdir"
  done
  tempdirs=()
}

# Python venv management

function mkvenv() {
  local venvname=${1:-.venv}
  if [ -d "$venvname" ]; then
    echo "Venv $venvname already exists." >&2
    return 1
  fi
  python3 -m venv "$venvname"
  source $venvname/bin/activate
  pip install --upgrade pip
  if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
  else
    touch requirements.txt
  fi
  if [ -d ".git" ]; then
    echo "$venvname" >> .gitignore
  fi
}

function venv() {
  local venvname=${1:-.venv}

  if [ -f "$venvname/bin/activate" ]; then
    source $venvname/bin/activate
  else
    echo "No venv found." >&2
  fi
}

function venv-save() {
  local venvname=${1:-.venv}
  if [ -f "$venvname/bin/activate" ]; then
    pip freeze > requirements.txt
  else
    echo "No venv found." >&2
  fi
}
